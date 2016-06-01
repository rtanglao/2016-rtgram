#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'
Dir.glob('*_n.jpg') do |jpg_file|
  $stderr.printf("file:%s\n", jpg_file)
  img =  Magick::Image.read(jpg_file).first
  pix = img.scale(1, 1)
  averageColor = pix.pixel_color(0,0)
  printf("#%2.2X%2.2X%2.2X\n", averageColor.red/257,
         averageColor.blue/257,  averageColor.blue/257)
end
