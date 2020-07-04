#!/bin/bash
FILE="events.log"#json写入文件
while true
do
tail -n1  /root/cobaltstrike/logs/*/events.log|grep '07'|tail -1>test.txt#查找cs日志目录events.log文件夹中包含7月份，且从最后一行开始
cat test.txt | while read line#重定向把test.txt第一行赋值给line
do
echo -e "{" > $FILE  
echo -e "\"msgtype\":\"text\",\"text\":{\"content\": \"$line\"},\"at\": {\"isAtAll\": true}" >> $FILE  #写入传输json
echo -e "}" >> $FILE
done
done
