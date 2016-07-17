#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'
allowed_extensions = %w[.jpg .jpeg .png]

exit if ARGV.length != 2

C_150x150dir = ARGV[0]
C_5x5dir = ARGV[1]
$stderr.printf("150x150dir:%s 5x5dir:%s\n", C_150x150dir, C_5x5dir)

Dir.foreach(C_150x150dir) do |jpg_file|
  next if jpg_file == '.' or jpg_file == '..'
  next if !allowed_extensions.any?{ |ext| jpg_file.end_with?(ext) }
  $stderr.printf("file:%s\n", jpg_file)
  begin
    img =  Magick::Image.read(C_150x150dir + "/" + jpg_file).first
    $stderr.printf("Got image\n")
  rescue Magick::ImageMagickError
    $stderr.printf("DID NOT GET image\n")
    next
  end
  thumb = img.scale(5, 5)
  thumb.write(C_5x5dir + "/" + jpg_file)
end
