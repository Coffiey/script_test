@echo off
set /p ServerIP=Please enter your GPUsoroban IP address:
(echo Host gpusoroban
echo 	HostName %ServerIP%) > %USERPROFILE%/.ssh/soroban_config
ssh gpusoroban -t './start.sh'
