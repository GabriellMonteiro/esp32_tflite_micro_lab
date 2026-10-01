FROM espressif/idf:v5.5.5

WORKDIR /workspaces/esp32_tflite_micro_lab

# Ferramentas usadas durante as etapas do laboratório.
RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl ca-certificates xxd \
    && rm -rf /var/lib/apt/lists/*

# Carrega o ESP-IDF em cada terminal interativo aberto pelo VS Code.
RUN printf '\n# ESP-IDF para terminais interativos do Dev Container.\n. /opt/esp/idf/export.sh >/dev/null 2>&1\n' >> /root/.bashrc
