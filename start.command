read -p "Please enter your GPUsoroban IP address:" ServerIP
echo "Host gpusoroban" > ~/.ssh/soroban_config
echo "	HostName $ServerIP" >> ~/.ssh/soroban_config

ssh gpusoroban -t './start.sh'
