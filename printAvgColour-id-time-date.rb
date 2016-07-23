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
allowed_extensions = %w[.jpg .jpeg .png]
# 0000001-1152722080165873450_545005592-923801_223885477945396_829374774_n.jpg
Dir.foreach('.') do |jpg_file|
  next if jpg_file == '.' or jpg_file == '..'
  next if !allowed_extensions.any?{ |ext| jpg_file.end_with?(ext) }
  $stderr.printf("file:%s\n", jpg_file)
  begin
    img =  Magick::Image.read(jpg_file).first
  rescue Magick::ImageMagickError
    next
  end
  printf "%s\n", jpg_file
  id = jpg_file.partition("-")[2].partition("-")[0]
  printf "id:%s\n", id
  
  photo = photosColl.find({ "id" => id}).\
          projection({ "id" => 1, "datetaken" => 1}).limit(1).first()
  pp photo
  printf("photo id:%s datetaken:%s\n", photo["id"], photo["datetaken"].to_s)
  exit
  # pix = img.scale(1, 1)
  # averageColor = pix.pixel_color(0,0)
  # printf("#%2.2X%2.2X%2.2X\n", averageColor.red/257,
  #        averageColor.blue/257,  averageColor.blue/257)
end
