#!/bin/bash
# Grab the page source from bbc iplayer save to a file called episodes
#�| change text value as required below
mount -t nfs 192.168.90.126:/volume2/ytdl /mnt/nas/
echo "Enter the url"
read -p 'url:  ' url
echo  "You entered ### ${url}"
read url

wget -O pagesource.html -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0" --no-check-certificate $url

echo "Enter the series code"
read -p 'code:  ' code
echo  "You entered ### ${code}"
read code

echo "Enter the series number"
read -p 'number:  ' number
echo  "You entered ### ${number}"
read number

mkdir series-$number
cd series-$number

edit=episodes_edit
cat pagesource.html | grep -E -o "$code.{0,3}" pagesource.html | sort -u > $edit
rm -r pagesource.html
urlsnip=https://www.bbc.co.uk/iplayer/episode/
sed -i "s+^+$urlsnip+g" $edit

mv $edit $code-series

youtube-dl -a $code-series
