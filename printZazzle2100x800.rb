#!/usr/bin/env ruby
require 'rubygems'
num_pixels = 0
ARGF.each_line do |hex_colour| 
  num_pixels_for_this_photo = rand(1..150)
  $stderr.printf("hex:%s, num_pixels:%d, num_pixels_for_this_photo:%d\n",
                 hex_colour, num_pixels, num_pixels_for_this_photo )
  if (num_pixels + num_pixels_for_this_photo) > 1680000
    num_pixels_for_this_photo =  1680000 - num_pixels
    $stderr.printf("last num_pixels_for_this_photo:%d\n", num_pixels_for_this_photo)
  end
  num_pixels_for_this_photo.times do puts hex_colour end
  num_pixels += num_pixels_for_this_photo
  $stderr.printf("num_pixels:%d\n", num_pixels)
  exit if num_pixels == 1680000
end


