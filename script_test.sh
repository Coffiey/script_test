# ①Githubからクローンします
git clone https://github.com/comfyanonymous/ComfyUI.git

# ②ディレクトリを移動します
cd ComfyUI

python -m venv venv

source venv/bin/activate

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
echo 'torch==2.1.0'
echo 'torchvision==0.16.0'
echo 'torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118'

) > requirements.txt

# ④以下の内容を貼り付け、Ctrl＋sで保存し、Ctrl+xで抜けます
# torch==2.1.0
# torchvision==0.16.0
# torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118
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

# ⑥requiremnt.txtを元にパッケージをインストールします
pip install -r requirements.txt

# ⑦ComfyUIを起動します
python main.py