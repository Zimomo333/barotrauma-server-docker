###########################################################
# Dockerfile that builds a Barotrauma server
###########################################################
FROM cm2network/steamcmd:root
ENV STEAMAPPID 1026340
ENV SRVDIR /home/brtm-server
# Install DOT.NET Rutime dependencies
# Install game files
# Remove packages and tidy up
RUN set -x \
	&& apt-get update \
	&& apt-get install -y wget \
  && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
	&& dpkg -i packages-microsoft-prod.deb \
	&& apt-get update \
	&& apt-get install -y apt-transport-https \
	&& apt-get update \
	&& apt-get install -y dotnet-runtime-3.1 \
	&& apt-get remove --purge -y \
		wget \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

COPY entry.sh /home/entry.sh
ENTRYPOINT bash /home/entry.sh

# Expose ports
EXPOSE 27015/tcp 27015/udp
EXPOSE 27016/tcp 27016/udp