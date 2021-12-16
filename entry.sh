#!/bin/bash

# Check that the game is up-to-date
"${SRVDIR}/steamcmd.sh" "${SRVDIR}/steamcmd.sh" \
    @ShutdownOnFailedCommand \
    @NoPromptForPassword \
    +login anonymous \
    +force_install_dir ${STEAMAPPDIR} \
    +app_update ${STEAMAPPID} \
    +'quit'

set -x \
&& mkdir -p /home/steam/.steam/sdk64 \
&& chown -R steam:steam /home/steam/.steam \
&& ln -s ${SRVDIR}/steamclient.so /home/steam/.steam/sdk64/steamclient.so

# Run the server!
"${SRVDIR}"/DedicatedServer