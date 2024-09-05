FROM nvidia/cuda:12.6.1-cudnn-runtime-ubuntu22.04

ARG HTTP_PROXY
ARG HTTPS_PROXY

ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTPS_PROXY
#RUN echo "Acquire::http { Proxy \"$http_proxy\" }; Acquire::https { Proxy \"$https_proxy\" };" > /etc/apt/apt.conf.d/01proxy  

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1

RUN apt update
RUN apt install git software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt remove --purge python3 -y
RUN apt install python3-venv -y

RUN apt install -y git curl wget vim
RUN apt install -y python3-dev python3-tk python3-html5lib python3-apt python3-pip python3-distutils python3-torch 
RUN apt install -y python-is-python3
RUN apt install -y pip

RUN apt-get clean

ENV ROOT=/stable-diffusion
RUN --mount=type=cache,target=/root/.cache/pip \
  git clone https://github.com/comfyanonymous/ComfyUI.git ${ROOT} && \
  cd ${ROOT} && \
  git checkout master && \
  pip install -r requirements.txt

WORKDIR ${ROOT}
COPY entrypoint.sh /docker/
RUN chmod u+x /docker/entrypoint.sh 
COPY extra_model_paths.yaml ${ROOT}/

ENV no_proxy="localhost, 127.0.0.1, ::1"
ENV NVIDIA_VISIBLE_DEVICES=all PYTHONPATH="${PYTHONPATH}:${PWD}" CLI_ARGS=""
EXPOSE 7870
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python -u main.py --listen --port 7870 ${CLI_ARGS}