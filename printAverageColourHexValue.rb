#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'
allowed_extensions = %w[.jpg .jpeg .png]
Dir.foreach('.') do |jpg_file|
  next if jpg_file == '.' or jpg_file == '..'
  next if !allowed_extensions.any?{ |ext| jpg_file.end_with?(ext) }
  $stderr.printf("file:%s\n", jpg_file)
  img =  Magick::Image.read(jpg_file).first
  pix = img.scale(1, 1)
  averageColor = pix.pixel_color(0,0)
  printf("#%2.2X%2.2X%2.2X\n", averageColor.red/257,
         averageColor.blue/257,  averageColor.blue/257)
end
