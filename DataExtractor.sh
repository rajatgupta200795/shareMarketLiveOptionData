x=[]
function DataExtractor(){
    eval str="$1"
    sudo /opt/couchbase/bin/cbq --script="$str" --engine=http://localhost:8091 -u Administrator -p rajat123 |  tail -n +6 > resultData.json;
    x=$(jq '.results ' resultData.json)
    echo $x
}

a=$@
DataExtractor "\${a}"
#echo $x