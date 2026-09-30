#!/bin/bash
set -e

echo "=== Installing Python & Dependencies ==="
amazon-linux-extras install python3.8 -y || yum install -y python3 python3-pip
pip3 install -r requirements.txt

echo "=== Starting Streamlit in Background ==="
nohup python3 -m streamlit run app.py --server.port 8080 --server.address 0.0.0.0 > streamlit.log 2>&1 &

echo "=== Streamlit Started ==="
