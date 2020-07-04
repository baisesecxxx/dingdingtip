#!/bin/bash  
inotifywait -mrq --timefmt '%Y%m%d' --format '%T,%w%f,%e' -e modify,delete,create,attrib /root/cobaltstrike/logs | while read FL
do#使用inotifywait查找root/cobaltstrike/logs/%Y%m%d变动文件
printf ${FL} | curl -X POST https://oapi.dingtalk.com/robot/send?access_token=xxxxxxxxxxx -H "Content-Type: application/json" -d@/root/cobaltstrike/events.log#如变动curl请求钉钉接口
echo "_"
done
