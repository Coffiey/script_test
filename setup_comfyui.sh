#!/bin/sh
sudo apt update
sudo apt install -y screen
sudo apt-get install -y libglib2.0-0

(
echo #!bin/bash
echo cd ~/ComfyUI
echo  python3 main.py
) > start.sh
chmod +rwx start.sh

git clone https://github.com/comfyanonymous/ComfyUI.git
cd ~/ComfyUI

pip install --upgrade pip
(
echo 'torchsde'
echo 'einops'
echo 'transformers>=4.25.1'
echo 'safetensors>=0.3.0'
echo 'aiohttp'
echo 'accelerate'
echo 'pyyaml'
echo 'Pillow'
echo 'scipy'
echo 'tqdm'
echo 'psutil'
echo 'onnxruntime-gpu'
echo 'torch==2.0.1'
echo 'torchvision==0.15.2'
echo 'torchaudio==2.0.2'
) > requirements.txt
pip install -r requirements.txt

chmod +rwx custom_nodes

cd ~/ComfyUI/custom_nodes
git clone https://github.com/Fannovel16/comfyui_controlnet_aux/
chmod +rwx comfyui_controlnet_aux
cd comfyui_controlnet_aux
pip install -r requirements.txt

cd ~/ComfyUI
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive
git clone https://github.com/Acly/comfyui-tooling-nodes.git


cd ~/ComfyUI/models/clip_vision
mkdir SD1.5


cd ~/ComfyUI/models/clip_vision/SD1.5
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors?download=true -O model.safetensors

cd ~/ComfyUI/models/upscale_models
wget https://huggingface.co/gemasai/4x_NMKD-Superscale-SP_178000_G/resolve/main/4x_NMKD-Superscale-SP_178000_G.pth
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X2_DIV2K.safetensors
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X3_DIV2K.safetensors
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X4_DIV2K.safetensors
wget https://huggingface.co/Acly/hat/resolve/main/HAT_SRx4_ImageNet-pretrain.pth
wget https://huggingface.co/Acly/hat/resolve/main/Real_HAT_GAN_sharper.pth


cd ~/ComfyUI/models/controlnet
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11f1e_sd15_tile_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11p_sd15_scribble_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_lineart_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_softedge_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_canny_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11f1p_sd15_depth_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11p_sd15_normalbae_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11p_sd15_openpose_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11p_sd15_seg_fp16.safetensors
wget https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors
wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/sai_xl_sketch_256lora.safetensors
wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/sai_xl_canny_256lora.safetensors
wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/sai_xl_depth_256lora.safetensors
wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/thibaud_xl_openpose_256lora.safetensors

cd ~/ComfyUI/models/loras
wget https://huggingface.co/latent-consistency/lcm-lora-sdv1-5/resolve/main/pytorch_lora_weights.safetensors?download=true -O lcm-lora-sdv1-5.safetensors
wget https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors?download=true -O lcm-lora-sdxl.safetensors

cd ~/ComfyUI/models/checkpoints
wget https://huggingface.co/syaimu/7th_Layer/resolve/main/7th_anime_v3/7th_anime_v3_C.safetensors?download=true -O 7th_anime_v3_C.safetensors

cd ~/ComfyUI/models/embeddings
wget https://huggingface.co/gsdf/Counterfeit-V3.0/resolve/main/embedding/EasyNegativeV2.safetensors?download=true -O EasyNegativeV2.safetensors

cd ~/ComfyUI/custom_nodes/ComfyUI_IPAdapter_plus/models
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors
wget https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors

cd ~/ComfyUI
python3 main.py
