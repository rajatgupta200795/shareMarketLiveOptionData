time=$1

if [ -z "$time" ]
then
echo "Please Enter Time";
fi

expiry="For "$(echo $time | cut -d'_' -f 1)

query='select raw tonumber(strike_price) from market where meta().id like "'$time'" and strike_price between "11000" and "12500" order by tonumber(strike_price)'
sudo /opt/couchbase/bin/cbq --script="$query" --engine=http://localhost:8091 -u Administrator -p rajat123 |  tail -n +6 > resultData.json;
x=$(jq '.results ' resultData.json);

query='select raw case when ce_chng_in_oi == "-" THEN 0 else tonumber(ce_chng_in_oi) END from market where meta().id like "'$time'" and strike_price between "11000" and "12500" order by tonumber(strike_price)'
sudo /opt/couchbase/bin/cbq --script="$query" --engine=http://localhost:8091 -u Administrator -p rajat123 |  tail -n +6 > resultData.json;
cy=$(jq '.results ' resultData.json);

query='select raw case when pe_chng_in_oi == "-" THEN 0 else tonumber(pe_chng_in_oi) END from market where meta().id like "'$time'" and strike_price between "11000" and "12500" order by tonumber(strike_price)'
sudo /opt/couchbase/bin/cbq --script="$query" --engine=http://localhost:8091 -u Administrator -p rajat123 |  tail -n +6 > resultData.json;
py=$(jq '.results ' resultData.json);

python3 test.py "${x[@]}" "${cy[@]}" "${py[@]}" "${expiry[@]}"

#sleep 60;

pkill -f test.py;

