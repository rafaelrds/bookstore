#!/bin/bash
sleeptime=$((60/$2));

for i in $(eval echo {1..$2});
do	
	if [ "$1" == "GET" ]; then
		curl -w "\nTotal Time: %{time_total}\n" "http://localhost:3000/api/books" -H "Accept-Encoding: gzip, deflate, sdch, br" -H "Accept-Language: en-US,en;q=0.8,pt-BR;q=0.6,pt;q=0.4" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36" -H "Accept: application/json, text/plain, */*" -H "Referer: http://localhost:3000/" -H "Cookie: io=ZHW35WcjRKQDRam3AAAE" -H "Connection: keep-alive" --compressed
	elif [ "$1" == "POST" ]; then
		curl -w "\nTotal Time: %{time_total}\n" "http://localhost:3000/api/books/" -H "Origin: http://localhost:3000" -H "Accept-Encoding: gzip, deflate, br" -H "Accept-Language: en-US,en;q=0.8,pt-BR;q=0.6,pt;q=0.4" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36" -H "Content-Type: application/json;charset=UTF-8" -H "Accept: application/json, text/plain, */*" -H "Referer: http://localhost:3000/" -H "Cookie: io=ZHW35WcjRKQDRam3AAAE" -H "Connection: keep-alive" --data-binary "{\"title\":\"eu\",\"genre\":\"Suspense\",\"author\":\"eu\",\"publisher\":\"eu\",\"description\":\"eu\",\"pages\":\"eu\",\"image_url\":\"https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/leisa_christmas_false_color.png?itok=Jxf0IlS4\",\"buy_url\":\"google.com\"}" --compressed
	fi
	sleep $sleeptime
done
