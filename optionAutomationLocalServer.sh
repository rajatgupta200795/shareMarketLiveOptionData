#!/bin/bash
while  true
do

echo "Fetching CSV files";
python3 ~/Downloads/shareMarketLiveOptionData/FetchOptionData.py
sleep 2

echo "CSV files are fetched";
echo "Uploading files to server";
scp  -i ~/Downloads/key-couchbase-instance-sharesathi21.pem  ~/Downloads/shareMarketLiveOptionData/*.csv   sharesathi21@34.83.244.171:~/shareMarketLiveOptionData/

echo "Files are uploaded successfully"
echo "Inserting data into server database"
ssh -i ~/Downloads/key-couchbase-instance-sharesathi21.pem sharesathi21@34.83.244.171 shareMarketLiveOptionData/localToServerAutomation.sh &

echo "Inserting data into local database"

~/Downloads/shareMarketLiveOptionData/DbInsert.sh

m=10#$(date +"%M");
s=10#$(date +"%S");


rmin=$(( 3 - $(( m % 3 )) ))
rsec=$(( 60 - s ))


if [ "$rmin" -eq 1 ]; then
totalSec=$rsec
echo $totalSec
fi


if [ "$rmin" -eq 2 ]; then
totalSec=$(( 60 + $rsec ))
echo $totalSec
fi


if [ "$rmin" -eq 3 ]; then
totalSec=$((  120 + $rsec )) 
echo $totalSec
fi

sleep $(( $totalSec + 10 ))

done
