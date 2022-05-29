#!/bin/bash
# Grab the page source from bbc iplayer save to a file called episodes
#�| change text value as required below
mount -t nfs 192.168.90.126:/volume2/ytdl /mnt/nas/


#echo "Enter the series name"
#read -p 'series-name:  ' series-name
#mkdir $seriesname

echo "Enter the url"
read -p 'url:  ' url

wget -O pagesource -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0" --no-check-certificate $url

echo "Enter the series code"
read -p 'code:  ' code

cat pagesource | grep -E -o "$code.{0,6}" pagesource | sort -u > episodes

rm -r pagesource
urlsnip=https://www.bbc.co.uk/iplayer/episode/
sed -i "s+^+$urlsnip+g" episodes


echo "Enter the series number"
read -p 'number:  ' number

mv episodes  $code-series-$number
mkdir series-$number
mv $code-series-$number series-$number/

youtube-dl -iw -o series-$number/'%(title)s-%(id)s.%(ext)s' -a series-$number/$code-series-$number

