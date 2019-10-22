#!/bin/bash
while true
do
	sudo python3 /home/global/PycharmProjects/OptionChainProject/FetchOptionData.py
	sleep 5
        /home/global/PycharmProjects/OptionChainProject//DbInsert.sh 

        sleep 60
done
