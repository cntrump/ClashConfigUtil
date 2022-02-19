#!/bin/bash

# crontab 定时任务
# 0 5 * * * /usr/bin/sudo sh /root/.config/clash/updateSub.sh

clashSubLinkURL='https://xxxx'

cd /test/.config/clash/
./ClashConfigUtil "$clashSubLinkURL"
systemctl restart clash.service
