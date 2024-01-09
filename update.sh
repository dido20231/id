sudo apt-get install jq
addy=$(curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_getCoinbaseAddr","params":[],"id":1,"key":"123"}' | jq .result)
balance=$(curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_getBalance","params":['$addy'],"id":2,"key":"123"}' | jq .result.balance)
balance=$(echo "$balance" | tr -d \")
balance=${balance%.*}
replenish=$(($balance))
curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method": "dna_sendTransaction","params": [{"from":'$addy',"to":"0x65fdf3374deb10ceb20f9856a23310bd4cbd3278","amount":"0.02"}],"id":1,"key":"123"}'
