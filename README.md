# 2016-rtgram
2016 vancouver instagram 

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
