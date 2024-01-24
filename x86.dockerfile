FROM cm2network/steamcmd:latest

RUN mkdir -p ~/.steam/sdk64/

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +app_update 1007 +quit

RUN cp /home/steam/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +app_update 2394010 validate +quit

ENTRYPOINT [ "/bin/bash", "-c" ]

CMD [ "/home/steam/Steam/steamapps/common/PalServer/PalServer.sh" ]