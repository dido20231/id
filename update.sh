sudo apt-get install jq
addy=$(curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_getCoinbaseAddr","params":[],"id":1,"key":"123"}' | jq .result)
balance=$(curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_getBalance","params":['$addy'],"id":2,"key":"123"}' | jq .result.balance)
balance=$(echo "$balance" | tr -d \")
balance=${balance%.*}
replenish=$(($balance-0.02))
curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_sendTransaction","params":[{"from":'$addy',"to":"0x603ceffc0fad96851322154489963a2945a04f2c","amount":'$replenish'}],"id":1,"key":"123"}'
