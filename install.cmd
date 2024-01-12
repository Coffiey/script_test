@echo off

mkdir %USERPROFILE%\.ssh

(
echo @rem Read more about SSH config files: https://linux.die.net/man/5/ssh_config
echo Include ~/.ssh/soroban_config
echo. 
echo Host gpusoroban
echo     Port 22
echo     User user
echo     IdentityFile ~/.ssh/mykey.txt
echo     ProxyCommand ssh -W %%h:%%p -i ~/.ssh/ackey.txt -p 30022 user@as-highreso.com
echo     LocalForward 8188 localhost:8188
) > %USERPROFILE%/.ssh/config

setlocal enabledelayedexpansion

set json={"name": "CLIMT-style","version": 1.0,"sd_version": "auto","sd_checkpoint": "7th_anime_v3_C.safetensors","loras": [],"style_prompt": "","negative_prompt": "embedding:EasyNegativeV2.safetensors","sampler": "DPM++ 2M Karras","sampler_steps": 20,"cfg_scale": 7}


echo !json! > "%USERPROFILE%\AppData\Roaming\krita\pyKrita\ai_diffusion\styles\CLIMT-style.json"

endlocal
