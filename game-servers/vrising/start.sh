#!/bin/bash
s=/home/game-servers/vrising
p=/home/game-servers/vrising/persistentdata
x=vrising
echo "Updating V-Rising Dedicated Server files..."
echo " "
/home/game-servers/steamcmd/steamcmd.sh +force_install_dir "/home/game-servers/vrising" +login anonymous +app_update 1829350 validate +quit
echo " "
if [ -f "$p/Settings/AmokServerGameSettings.json" ]; then
        echo "$p/Settings/AmokServerGameSettings.json found. Copying Master Config file."
        cp "$p/Settings/AmokServerGameSettings.json" "$s/VRisingServer_Data/StreamingAssets/Settings/ServerGameSettings.json" 2>&1
fi
if [ -f "$p/Settings/AmokServerHostSettings.json" ]; then
        echo "$p/Settings/AmokServerHostSettings.json found. Copying Master Config file."
        cp "$p/Settings/AmokServerHostSettings.json" "$s/VRisingServer_Data/StreamingAssets/Settings/ServerHostSettings.json" 2>&1
fi
echo "Starting V Rising Dedicated Server"
echo " "
screen -dmS $x xvfb-run --auto-servernum --server-args='-screen 0 1920x1080x24:32' wine /home/game-servers/vrising/VRisingServer.exe -persistentDataPath $p -log
