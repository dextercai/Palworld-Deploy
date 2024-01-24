#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker stop palworld_server
sudo docker rm palworld_server

sudo docker pull dextercai/palworld_server:x86_latest

sudo docker run -it \
     --name palworld_server --restart always \
     -p 8211:8211/udp \
     -v ${dir_path}/saved_game/:/home/steam/Steam/steamapps/common/PalServer/Pal/Saved/ \
     -d dextercai/palworld_server:x86_latest \
     /home/steam/Steam/steamapps/common/PalServer/PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS