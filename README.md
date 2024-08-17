# ComfyUI CUDA Docker

Dieses Projekt stellt eine Docker-Umgebung für ComfyUI mit CUDA-Unterstützung bereit. 
ComfyUI ist ein benutzerfreundliches Interface für Stable Diffusion, das es Benutzern ermöglicht, auf einfache Weise Bilder zu generieren und zu bearbeiten.

## Voraussetzungen

- Docker
- NVIDIA-Grafikkarte mit CUDA-Unterstützung
- Docker Compose

## Abhängigkeiten

Dieses Projekt hat eine Abhängigkeit vom Datenverzeichnis des Projekts [Automatic1111 CUDA Docker](https://git.krim.dev/library/automatic1111_cuda_docker). Stellen Sie sicher, dass Sie das Automatic1111-Projekt korrekt eingerichtet und das Datenverzeichnis erstellt haben, bevor Sie fortfahren.

## Installation

1. Klonen Sie dieses Repository:
   ```
   git clone https://git.krim.dev/library/comfyui_cuda_docker.git
   ```

2. Navigieren Sie in das Projektverzeichnis:
   ```
   cd comfyui_cuda_docker
   ```

3. Starten Sie den Docker-Container mit Docker Compose:
   ```
   docker-compose up -d
   ```

4. Öffnen Sie einen Webbrowser und navigieren Sie zu `http://localhost:7870`, um auf die ComfyUI-Oberfläche zuzugreifen.


## Verwendung

Nach erfolgreicher Installation und Konfiguration können Sie die ComfyUI-Oberfläche in Ihrem Webbrowser unter `http://localhost:7870` aufrufen. Die Ergebnisse werden standardmäßig im Ornder ./output abgelegt.