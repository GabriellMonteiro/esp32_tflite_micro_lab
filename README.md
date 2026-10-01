# Laboratório — TensorFlow Lite Micro no ESP32-S3

Projeto didático para a atividade da Aula 4 de **IA Embarcada e Modelos Compactos**.
Ele começa com um firmware ESP-IDF mínimo, depois importa o `hello_world` oficial do
`esp-tflite-micro` e finalmente o executa no Wokwi.

## Objetivo da atividade

Executar no ESP32-S3 um modelo TensorFlow Lite Micro que aproxima a função seno,
registrar a simulação no Wokwi e produzir uma breve análise do código.

## Comece aqui

Siga os arquivos nesta ordem:

1. [Roteiro](docs/00-roteiro.md)
2. [Ambiente](docs/01-ambiente.md)
3. [Firmware mínimo](docs/02-firmware-minimo.md)
4. [Importar o Hello World](docs/03-importar-hello-world.md)
5. [Build e Wokwi](docs/04-build-wokwi.md)
6. [Análise do código](docs/05-analise.md)
7. [Evidências e entrega](docs/06-entrega.md)
8. [Extensão opcional](docs/07-desafio-extra.md)

## Estado inicial esperado

Antes de importar o modelo, compile e simule o firmware mínimo:

```bash
idf.py set-target esp32s3
idf.py build
```

Ele deve mostrar no monitor serial uma mensagem confirmando que o ambiente e o Wokwi
estão corretos. Em seguida, execute:

```bash
./scripts/importar-hello-world.sh
```

O script baixa a dependência oficial pelo Component Manager do ESP-IDF e substitui o
firmware mínimo pelos fontes do exemplo `hello_world`.

## Estrutura

```text
.
├── .devcontainer/       # ESP-IDF isolado no Docker
├── docs/                # roteiro, explicações e evidências
├── main/                # firmware inicial; recebe o exemplo na etapa 3
├── scripts/             # automação didática, sem ocultar os passos
├── diagram.json         # ESP32-S3 e monitor serial no Wokwi
└── wokwi.toml           # artefatos gerados para o simulador
```

> Não versione `build/`, `managed_components/`, `sdkconfig` nem `dependencies.lock`.
> Eles são gerados localmente pelo ESP-IDF.

