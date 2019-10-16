option_expiry_json_data(){

i=0
while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22
do

  if [ $i == 0 ]
  then
    i=1
    continue
  fi


  if ! [[ $f1 =~ ^[0-9]+$ ]]
then
f1="\"$f1\""
fi

if ! [[ $f2 =~ ^[0-9]+$ ]]
then
f2="\"$f2\""
fi

if ! [[ $f3 =~ ^[0-9]+$ ]]
then
f3="\"$f3\""
fi

if ! [[ $f4 =~ ^[0-9]+$ ]]
then
f4="\"$f4\""
fi

if ! [[ $f5 =~ ^[0-9]+$ ]]
then
f5="\"$f5\""
fi

if ! [[ $f6 =~ ^[0-9]+$ ]]
then
f6="\"$f6\""
fi

if ! [[ $f7 =~ ^[0-9]+$ ]]
then
f7="\"$f7\""
fi

if ! [[ $f8 =~ ^[0-9]+$ ]]
then
f8="\"$f8\""
fi

if ! [[ $f9 =~ ^[0-9]+$ ]]
then
f9="\"$f9\""
fi

if ! [[ $f10 =~ ^[0-9]+$ ]]
then
f10="\"$f10\""
fi

if ! [[ $f11 =~ ^[0-9]+$ ]]
then
f11="\"$f11\""
fi

if ! [[ $f12 =~ ^[0-9]+$ ]]
then
f12="\"$f12\""
fi

if ! [[ $f13 =~ ^[0-9]+$ ]]
then
f13="\"$f13\""
fi

if ! [[ $f14 =~ ^[0-9]+$ ]]
then
f14="\"$f14\""
fi

if ! [[ $f15 =~ ^[0-9]+$ ]]
then
f15="\"$f15\""
fi

if ! [[ $f16 =~ ^[0-9]+$ ]]
then
f16="\"$f16\""
fi

if ! [[ $f17 =~ ^[0-9]+$ ]]
then
f17="\"$f17\""
fi

if ! [[ $f18 =~ ^[0-9]+$ ]]
then
f18="\"$f18\""
fi

if ! [[ $f19 =~ ^[0-9]+$ ]]
then
f19="\"$f19\""
fi

if ! [[ $f20 =~ ^[0-9]+$ ]]
then
f20="\"$f20\""
fi

if ! [[ $f21 =~ ^[0-9]+$ ]]
then
f21="\"$f21\""
fi

if ! [[ $f22 =~ ^[0-9]+$ ]]
then
f22="\"$f22\""
fi


  data="{\"created\" : $created, \"ce_oi\" : $f2, \"ce_chng_in_oi\" : $f3, \"ce_volume\" : $f4, \"ce_iv\" : $f5, \"ce_ltp\" : $f6, \"ce_net_chng\" : $f7, \"ce_bidqty\" : $f8, \"ce_bidprice\" : $f9, \"ce_askprice\" : $f10, \"ce_askqty\" : $f11, \"strike_price\" : ${f12%.*}, \"pe_bidqty\" : $f13, \"pe_bidprice\" : $f14, \"pe_askprice\" : $f15, \"pe_askqty\" : $f16, \"pe_net_chng\" : $f17, \"pe_ltp\" : $f18, \"pe_iv\" : $f19, \"pe_volume\" : $f20, \"pe_chng_in_oi\" : $f21, \"pe_oi\" : $f22}"
  #data=$(echo $data | jq '.')
  strike_price_text=":${f12%.*}:"
  doc_id=$(echo $option_file_name | cut -d "." -f 1) #remove .csv
  doc_id=$(sed "s/T/$strike_price_text/2" <<< "$doc_id")
  echo $data
  sudo /opt/couchbase/bin/cbq --script="INSERT INTO market (KEY, VALUE) VALUES ('$doc_id', $data)" --engine=http://localhost:8091 -u Administrator -p rajat123
done < "$option_file_name"
}


while IFS= read -r expiry_date; do
  option_file_name=$(ls | grep $expiry_date)
  x=$option_file_name
  created=$(echo $(echo $(echo $x | cut -d "." -f 1) | cut -d "_" -f 2) | cut -d "T" -f 2)
  option_expiry_json_data $option_file_name $created
done < "Running_Expiry_Date.txt"