#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'
require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL # http://stackoverflow.com/questions/30292100/how-can-i-disable-mongodb-log-messages-in-console


MONGO_HOST = ENV["MONGO_HOST"]
raise(StandardError,"Set Mongo hostname in ENV: 'MONGO_HOST'") if !MONGO_HOST
MONGO_PORT = ENV["MONGO_PORT"]
raise(StandardError,"Set Mongo port in ENV: 'MONGO_PORT'") if !MONGO_PORT
MONGO_USER = ENV["MONGO_USER"]
MONGO_PASSWORD = ENV["MONGO_PASSWORD"]
INSTAGRAM_DB = ENV["INSTAGRAM_DB"]
raise(StandardError,"Set Mongo instagram database name in ENV: 'INSTAGRAM_DB'") if !INSTAGRAM_DB

db = Mongo::Client.new([MONGO_HOST], :database => INSTAGRAM_DB, :port => MONGO_PORT)
if MONGO_USER
  auth = db.authenticate(MONGO_USER, MONGO_PASSWORD)
  if !auth
    raise(StandardError, "Couldn't authenticate, exiting")
    exit
  end
end

photosColl = db[:photos]

printf("colour,id,dayofweek-month-dayofmonth,daynumber,unixtimeint,hour\n")
header = TRUE
ARGF.each do |line|
  if header
    header = FALSE
    next
  end
  #pp line
  id = line.chomp.split(",")[1]
  $stderr.printf "id:%s\n", id
  
  photo = photosColl.find({ "id" => id}).\
          projection({ "id" => 1, "datetaken" => 1}).limit(1).first()
  #pp photo
  hour =  photo["datetaken"].localtime.hour
  unixtimeint =  photo["datetaken"].localtime

  printf("%s,%d,%2.2d\n",
         line.chomp, unixtimeint, hour)
end
