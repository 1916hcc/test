![vLLM Kunlun Logo](vllm_kunlun/patches/image.png)

<p align="center">
      ｜<a href=""><b>Documentation</b></a> |   
      <a href=""><b>Users Forum</b>
      </a> | 
</p>

##  Table of Contents

- [Overview](#overview)
- [Supported Models](#supported-models)
- [Features Supported](#features-supported)
- [Installation](#installation)
  - [1. Base Docker Environment](#1base-docker-environment)
  - [2. Install vLLM-kunlun](#2install-vllm-kunlun)
  - [3. Update xpytorch](#3update-xpytorch)
- [Quick Start](#quick-start)
  - [1. Set up the environment](#1set-up-the-environment)
  - [2. Run the server](#2run-the-server)
- [Documentation](#documentation)


---
*Latest News* 🔥
- [2025/11] 
- [2025/11] 
- [2025/11] 
- [2025/11] 
- [2025/11] 
- [2025/11] 
- [2025/11] 
- [2024/11] 
---


# Overview

vLLM Kunlun (vllm-kunlun) is a community-maintained hardware plugin designed to seamlessly run vLLM on the Kunlun XPU. It is the recommended approach for integrating the Kunlun backend within the vLLM community, adhering to the principles outlined in the [RFC]: Hardware pluggable. This plugin provides a hardware-pluggable interface that decouples the integration of the Kunlun XPU with vLLM.

By utilizing the vLLM Kunlun plugin, popular open-source models, including Transformer-like, Mixture-of-Expert, Embedding, and Multi-modal LLMs, can run effortlessly on the Kunlun XPU.

# Supported Models
## Generative Models

|Model|TP1|TP2|TP4|TP8|Note|
|-|-|-|-|-|-|
|[Qwen2.5-7B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|❌||
|[Qwen2.5-14B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen2.5-32B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen2.5-72B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||✅|✅|✅||
|[Qwen3-8B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen3-14B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen3-32B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen3-30B-A3B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen3-235B-A3B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||||✅||
|[Qwen3-480B-A3B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||||✅||
|[Qwen3-Coder](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||||✅||

## Multimodal Language Models
|Model|TP1|TP2|TP4|TP8|Note|
|-|-|-|-|-|-|
|[Qwen2.5-VL-3B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|❌|❌||
|[Qwen2.5-VL-7B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|❌||
|[Qwen2.5-VL-32B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[Qwen2.5-VL-72B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-8B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-8B-Instruct](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-14B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-30B-A3B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-38B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)|✅|✅|✅|✅||
|[InternVL3_5-241B-A28B](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||||✅||
|[InternS1](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/FkK8Jm9H3UN70z)||||✅||



# Features Supported
|Feature|Status|Note|
|-|-|-|
|Tensor Parallel|🟢 Functional||
|Experts Parallel|🟢 Functional||
|Graph Mode|🟢 Functional||
|LoRA|⚠️ Nest Test|Only LLM models|

# Installation

## 1.Base Docker Environment
### Setup environment using container
```
docker pull iregistry.baidu-int.com/xmlir/xmlir_ubuntu_2004_x86_64:v0.32
```

```bash
#!/bin/bash

XPU_NUM=8

DOCKER_DEVICE_CONFIG=""

if [ $XPU_NUM -gt 0 ]; then
    for idx in $(seq 0 $((XPU_NUM-1))); do
        DOCKER_DEVICE_CONFIG="${DOCKER_DEVICE_CONFIG} --device=/dev/xpu${idx}:/dev/xpu${idx}"
    done
    DOCKER_DEVICE_CONFIG="${DOCKER_DEVICE_CONFIG} --device=/dev/xpuctrl:/dev/xpuctrl"
fi

export build_image="iregistry.baidu-int.com/xmlir/xmlir_ubuntu_2004_x86_64:v0.32"
docker run -itd ${DOCKER_DEVICE_CONFIG} \
    --net=host \
    --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
    --tmpfs /dev/shm:rw,nosuid,nodev,exec,size=32g \
    --cap-add=SYS_PTRACE \
    -v /home/users/vllm-kunlun:/home/vllm-kunlun \
    -v /ssd1:/ssd1\
    -v /ssd3:/ssd3\
    -v /usr/local/bin/xpu-smi:/usr/local/bin/xpu-smi \
    --name "$1" \
    -w /workspace \
    "$build_image" /bin/bash
```

## 2.Install vLLM-kunlun
### Install vLLM 0.10.1.1
```
conda activate python310_torch25_cuda

pip install vllm==0.10.1.1 --no-build-isolation --no-deps --index-url https://pip.baidu-int.com/simple/
```
### Build and Install
Navigate to the vllm-kunlun directory and build the package:
```
git clone xxxx # TODO: replace with Github Url to install vllm-kunlun

cd baidu/hac-aiacc/vllm-kunlun

python setup.py build

python setup.py install

pip install -r requirements.txt
```
### Replace eval_frame.py
Copy the eval_frame.py patch:
```
cp vllm_kunlun/patches/eval_frame.py /root/miniconda/envs/python310_torch25_cuda/lib/python3.10/site-packages/torch/_dynamo/eval_frame.py
```
## 3.Update xpytorch
```
wget https://klx-sdk-release-public.su.bcebos.com/xpytorch/release/3.3.1.0/xpytorch-cp310-torch251-ubuntu2004-x64.run

bash xpytorch-cp310-torch251-ubuntu2004-x64.run

bcecmd bos cp bos:/cce-ai-models/dongxinyu03/vllm/output/xtorch_ops-0.1.1799+dbdeb408-cp310-cp310-linux_x86_64.whl ./

pip install xtorch_ops-0.1.1799+dbdeb408-cp310-cp310-linux_x86_64.whl

pip install \
"https://cce-ai-models.bj.bcebos.com/v1/dongxinyu03/xspeedgate_ops/xspeedgate_ops-0.0.0-cp310-cp310-linux_x86_64.whl?authorization=bce-auth-v1%2FALTAKxPW2jzoJUuFZmI19s3yry%2F2025-10-29T11%3A32%3A38Z%2F-1%2Fhost%2F3f2c2d62d23b96ca8e59fb69c73e9e7b75d06f2fb4af5829f69ffc9149dcd48f"

```
## Quick Start

### 1.Set up the environment
```
cd /workspace/baidu/hac-aiacc/vllm-kunlun
chmod +x setup_env.sh && source setup_env.sh
```
### 2.Run the server
```bash
VLLM_USE_V1=1 python -m vllm.entrypoints.openai.api_server \
      --host localhost \
      --port 8989 \
      --model /ssd3/models/Qwen3-8B \
      --gpu-memory-utilization 0.95 \
      --trust-remote-code \
      --max-model-len 32768 \
      --tensor-parallel-size 1 \
      --dtype float16 \
      --max_num_seqs 128 \
      --max_num_batched_tokens 32768 \
      --max-seq-len-to-capture 32768 \
      --block-size 128 \
      --no-enable-prefix-caching \
      --no-enable-chunked-prefill \
      --distributed-executor-backend mp \
      --served-model-name Qwen3-8B \
      --compilation-config '{"splitting_ops": ["vllm.unified_attention_with_output_kunlun",
            "vllm.unified_attention", "vllm.unified_attention_with_output",
            "vllm.mamba_mixer2"]}' 
```

## Documentation
- use the performance profiling tool [Profiler](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/K3X1k4ASql/WZW8G4BbgX_9X-)
- use the performance evaluation tool [Benchmark](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/m0vAkz2XDP/iyIPEgN3BDl0wf)
- how to use the precision tool [XRay](https://ku.baidu-int.com/knowledge/HFVrC7hq1Q/pKzJfZczuc/lxIG8taKTQ/57005f7ZjDfSFV)


