FROM openjdk:latest
LABEL app=minecraft
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
RUN mkdir -p /usr/local/logs /usr/local/mods
RUN chgrp -R 0 /run /usr/local /var/cache /var/log /var/run && chmod -R g=u /run /usr/local /var/cache /var/log /var/run
RUN wget -r https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
RUN wget -r https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.17.1-37.0.104/forge-1.17.1-37.0.104-installer.jar
COPY server.jar /usr/local/
COPY forge-1.17.1-37.0.104-installer.jar /usr/local/mods
COPY  /usr/local/mods
WORKDIR /usr/local
ENTRYPOINT java -Xmx2G -Xms2G -jar minecraft_server.1.16.5.jar nogui
