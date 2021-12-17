#!/bin/bash

# Check that the game is up-to-date
"${STEAMCMDDIR}/steamcmd.sh" "${STEAMCMDDIR}/steamcmd.sh" \
    @ShutdownOnFailedCommand \
    @NoPromptForPassword \
    +login anonymous \
    +force_install_dir ${STEAMAPPDIR} \
    +app_update ${STEAMAPPID} \
    +'quit'

# Run the server!
"${STEAMAPPDIR}"/DedicatedServer