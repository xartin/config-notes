#!/bin/bash
s=/game-servers/vrising
p=/game-servers/vrising/persistentdata
x=vrising
echo "Updating V-Rising Dedicated Server files..."
echo " "
/game-servers/steamcmd/steamcmd.sh +force_install_dir "/game-servers/vrising" +login anonymous +app_update 1829350 validate +quit
echo " "
if [ -f "$p/Settings/ServerGameSettings.json" ]; then
        echo "$p/Settings/ServerGameSettings.json found. Copying Master Config file."
        cp "$p/Settings/ServerGameSettings.json" "$s/VRisingServer_Data/StreamingAssets/Settings/ServerGameSettings.json" 2>&1
fi
if [ -f "$p/Settings/ServerHostSettings.json" ]; then
        echo "$p/Settings/ServerHostSettings.json found. Copying Master Config file."
        cp "$p/Settings/ServerHostSettings.json" "$s/VRisingServer_Data/StreamingAssets/Settings/ServerHostSettings.json" 2>&1
fi
echo "Starting V Rising Dedicated Server"
echo " "
screen -dmS $x xvfb-run --auto-servernum --server-args='-screen 0 1920x1080x24:32' wine $s/VRisingServer.exe -persistentDataPath $p -log
