#!/bin/bash
sleeptime=$((60/$2));

for i in $(eval echo {1..$2});
do	
	if [ "$1" == "GET" ]; then
		curl -s -w "\nTotal Time: %{time_total}\n" -o NUL "http://localhost:3000/api/genres"
	elif [ "$1" == "POST" ]; then
		curl -s -w "\nTotal Time: %{time_total}\n" -o NUL -X POST -H "Content-Type:application/json" "http://localhost:3000/api/genres" -d '{"name":"random genre"}'
	fi
	sleep 1
done
