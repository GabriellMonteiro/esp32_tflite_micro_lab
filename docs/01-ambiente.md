# 1. Ambiente isolado

Abra a pasta `esp32_tflite_micro_lab` no VS Code e use o comando:

```text
Dev Containers: Reopen in Container
```

No terminal que abrir dentro do container, confira:

```bash
idf.py --version
idf.py set-target esp32s3
```

## Por que usar o container?

O Windows fica responsável por interface, Docker e VS Code. O container fornece
compilador, CMake, Python e ESP-IDF em versões reproduzíveis. Assim, o projeto não
depende de uma instalação global do ESP-IDF.

## Verificação opcional do host

No PowerShell do Windows:

```powershell
./scripts/check-host.ps1
```

Você precisa de Docker Desktop, WSL2, VS Code, extensão Dev Containers e extensão Wokwi.
