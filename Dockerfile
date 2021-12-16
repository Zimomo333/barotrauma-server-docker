FROM steamcmd/steamcmd:ubuntu-18
ENV SRVDIR /home/brtm-server
RUN apt-get update && \
apt-get install -y wget && \
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
dpkg -i packages-microsoft-prod.deb && \
rm packages-microsoft-prod.deb && \
apt-get update && \
apt-get install -y apt-transport-https && \
apt-get update && \
apt-get install -y dotnet-runtime-6.0 && \
apt-get remove --purge -y wget && \
apt-get clean autoclean && \
apt-get autoremove -y && \
ln -s /root/.steam/steam/steamcmd/linux64/steamclient.so /usr/lib/x86_64-linux-gnu/steamclient.so

COPY entry.sh /home/entry.sh
ENTRYPOINT bash /home/entry.sh

EXPOSE 27015-27016/udp