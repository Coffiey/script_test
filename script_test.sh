sudo apt install -y python3.8-venv
sudo apt-get install libglib2.0-0 -y

# ①Githubからクローンします
git clone https://github.com/comfyanonymous/ComfyUI.git

# ②ディレクトリを移動します
cd ComfyUI

# installs venv
python -m venv venv

source venv/bin/activate
pip install --upgrade pip

# ③requirement.txtをエディターで開きます
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
echo 'torch==2.0.1'
echo 'torchvision==0.15.2'
echo 'torchaudio==2.0.2'
) > requirements.txt

# ④以下の内容を貼り付け、Ctrl＋sで保存し、Ctrl+xで抜けます

# ⑥requiremnt.txtを元にパッケージをインストールします
pip install -r requirements.txt

chmod +rwx custom_nodes

cd custom_nodes

git clone https://github.com/Fannovel16/comfyui_controlnet_aux/

chmod +rwx comfyui_controlnet_aux
cd comfyui_controlnet_aux

pip install -r requirements.txt

cd ..

git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive

git clone https://github.com/Acly/comfyui-tooling-nodes.git

cd ../models/clip_vision

mkdir SD1.5
cd SD1.5

#shared models
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors?download=true -O model.safetensors

cd ../upscale_models

wget https://huggingface.co/gemasai/4x_NMKD-Superscale-SP_178000_G/resolve/main/4x_NMKD-Superscale-SP_178000_G.pth
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X2_DIV2K.safetensors
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X3_DIV2K.safetensors
wget https://huggingface.co/Acly/Omni-SR/resolve/main/OmniSR_X4_DIV2K.safetensors


# SD 1.5 model install
cd ../controlnet

wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_lora_rank128_v11f1e_sd15_tile_fp16.safetensors

cd ../../custom_nodes/ComfyUI_IPAdapter_plus/models

wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors

cd ../../../models/loras

wget https://huggingface.co/latent-consistency/lcm-lora-sdv1-5/resolve/main/pytorch_lora_weights.safetensors?download=true -O lcm-lora-sdv1-5.safetensors

#for SD XL

wget https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors?download=true -O lcm-lora-sdxl.safetensors

cd ../../custom_nodes/ComfyUI_IPAdapter_plus/models
wget https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors


#  THIS IS A TEST RUN AND NEEDS REVIEWING  CHECKPOINTS
cd ../../../models/checkpoints

wget https://huggingface.co/syaimu/7th_Layer/resolve/main/7th_anime_v3/7th_anime_v3_C.safetensors?download=true -O 7th_anime_v3_C.safetensors
# ⑦ComfyUIを起動します

#  redirect to comfyUI root drectory
cd ../../

python main.py