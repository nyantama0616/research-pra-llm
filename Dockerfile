FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  git \
  wget \
  && apt-get clean

# Pythonライブラリのインストール
RUN pip3 install --upgrade pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

# 作業ディレクトリを作成
WORKDIR /app

# 必要なスクリプトやデータをコピー
COPY . /app

# デフォルトのコマンド
CMD ["python3", "main.py"]
