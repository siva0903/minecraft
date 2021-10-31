FROM centos
LABEL app=minecraft
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
RUN yum install -y wget java-1.8.0-openjdk 
RUN mkdir -p /usr/local/logs /usr/local/mods
RUN chgrp -R 0 /run /usr/local /var/cache /var/log /var/run && chmod -R g=u /run /usr/local /var/cache /var/log /var/run
WORKDIR /usr/local
RUN wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.17.1-37.0.104/forge-1.17.1-37.0.104-installer.jar
ENTRYPOINT java -Xmx2G -Xms2G -jar server.jar nogui 
