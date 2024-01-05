# ①Githubからクローンします
git clone https://github.com/comfyanonymous/ComfyUI.git

# ②ディレクトリを移動します
cd ComfyUI

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
) > requirements.txt

# ④以下の内容を貼り付け、Ctrl＋sで保存し、Ctrl+xで抜けます

# torchsde
# einops
# transformers>=4.25.1
# safetensors>=0.3.0
# aiohttp
# accelerate
# pyyaml
# Pillow
# scipy
# tqdm
# psutil

# ⑤pytorchをインストールします。
# pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118

# ⑥requiremnt.txtを元にパッケージをインストールします
# pip install -r requirements.txt

# ⑦ComfyUIを起動します
# python main.py