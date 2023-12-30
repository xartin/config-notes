#!/bin/bash
nvidia-smi -pm ENABLED
nvidia-smi -pl 110 -i 0
nvidia-smi -pl 110 -i 1
nvidia-smi -pl 110 -i 2
nvidia-smi -pl 110 -i 3
nvidia-smi -pl 110 -i 4
nvidia-smi -pl 110 -i 5
nvidia-smi -pl 110 -i 6
X :1 &
export DISPLAY=:1
nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:1]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:2]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:3]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:4]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:5]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:6]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
nvidia-settings -a "[gpu:1]/GPUFanControlState=1"
nvidia-settings -a "[gpu:2]/GPUFanControlState=1"
nvidia-settings -a "[gpu:3]/GPUFanControlState=1"
nvidia-settings -a "[gpu:4]/GPUFanControlState=1"
nvidia-settings -a "[gpu:5]/GPUFanControlState=1"
nvidia-settings -a "[gpu:6]/GPUFanControlState=1"
nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:2]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:3]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:4]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:5]/GPUTargetFanSpeed=65"
nvidia-settings -a "[fan:6]/GPUTargetFanSpeed=65"
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:2]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:3]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:4]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:5]/GPUMemoryTransferRateOffset[3]=500'
nvidia-settings -a '[gpu:6]/GPUMemoryTransferRateOffset[3]=500'
pkill -fn '^/usr/libexec/Xorg '
