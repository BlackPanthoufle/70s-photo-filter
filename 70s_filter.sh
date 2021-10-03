#!/bin/sh

convert $1 -fill white -colorize 30% bright.jpg

magick bright.jpg -gaussian-blur 0x8 blur.jpg

magick composite -compose softlight blur.jpg bright.jpg screen_compose.jpg

convert screen_compose.jpg -fill blue -colorize 35% blue_filter.jpg

convert screen_compose.jpg -fill yellow -colorize 40% yellow_filter.jpg

magick composite -compose multiply blue_filter.jpg yellow_filter.jpg color_filter.jpg

magick color_filter.jpg -evaluate gaussian_noise 0.5 result.jpg

rm bright.jpg blur.jpg screen_compose.jpg blue_filter.jpg yellow_filter.jpg color_filter.jpg
