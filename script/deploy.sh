#!/bin/sh
ssh root@139.180.141.237 <<EOF
 cd ~/react-folder-structure
 git pull
 npm install && npm run build
 pm2 restart all
 exit
EOF