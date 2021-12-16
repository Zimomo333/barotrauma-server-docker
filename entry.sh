chown -R steam:steam "${SRVDIR}"
"${STEAMCMDDIR}/steamcmd.sh" +force_install_dir ${SRVDIR} +login anonymous +app_update 1026340 validate +quit
"${SRVDIR}"/DedicatedServer