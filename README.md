# 2016-rtgram
2016 vancouver instagram 

## 27 July 2016
create files for holy

1. ```./AddHourToAvgColour-id-time-date-csv.rb  ./THUMBNAIL_150x150/23july2016-ig-van-2016-jan-may-2016-avgcolor-id-mf-month-day-daynum.csv >27july2016-ig-van-2016-jan-may-2016-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv```
1. ``` grep FriJan1 27july2016-ig-van-2016-jan-may-2016-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv >01january2016-ig-avgcolour-id-mf-month-day-daynum-unixtime-hour.csv``` #get a file for just january 1, 2016


## 23 July 2016

1. ```cd THUMBNAIL_150x150```
1. ```../printAvgColour-id-time-date.rb >23july2016-ig-van-2016-jan-may-2016-avgcolor-id-mf-month-day-daynum.csv``` # CSV file for R pie chart
1. ```cat 23july2016-ig-van-2016-jan-may-2016-avgcolor-id-mf-month-day-daynum.csv | grep Jan >2016-january-2016-avgcolor-id-mf-month-day-daynum.csv``` # file for small multiples for each of the 31 days of January

## 22 July 2016

idea: square pie charts and/or regular round pie charts!

## 17July2016

Creating a zazzle graphic (which seemed to work fine in yoshirt):

1. ```cd THUMBNAIL_5x5```
2. ```ls -1 | head -67200 >first67200.txt # 2100/5 = 420x 800/5=160 420x160=67200, zazzle size: 2100px X 800px``` Riffing off of https://gist.github.com/rtanglao/8988d2602238661b3138
3. ```gm montage -verbose -adjoin -tile 420x160 +frame +shadow +label -adjoin -geometry '5x5+0+0<' @first67200.txt first67200photos.png```

## 16July2016
```sh
mkdir THUMBNAIL_5x5
./create5x5thumbnails.rb THUMBNAIL_150x150 THUMBNAIL_5x5/
```
## 31May2016

1. get average colour of all thumbails
```sh
cd THUMBNAIL_150x150
../printAverageColourHexValue.rb >31may2016avgcolour.txt
```
2. print to zazzle graphic
```sh
cat 31may2016avgcolour.txt | ../printZazzle2100x800.rb \
> 31May2016-834pm-zazzle-2100x800-1hexcolourperline
```
3. create RAW file
```sh
xxd -r -p 31May2016-834pm-zazzle-2100x800-1hexcolourperline >
31May2016-834pm-zazzle-2100x800.raw (or.rgb, photoshop requires .raw)
```
4. open in photoshop save as png, no compression 2100x800 3 bytes per pixel

## 29May 2016
1. download 150x150:
```sh
mkdir THUMBNAIL_150x150
cd !$
../download150x150-ig.rb
```

## 28May2016

1. download metadata using
```sh
    . setupRTInstagram
    backupPublicVancouverPhotosByDateTaken.rb 2016 1 1 2016 5 28
```
