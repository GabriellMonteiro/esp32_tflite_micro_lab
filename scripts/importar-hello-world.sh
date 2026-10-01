#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f CMakeLists.txt || ! -d main ]]; then
  echo "Execute este script a partir da raiz do projeto." >&2
  exit 1
fi

if [[ -f main/main.cc || -f main/main.c ]]; then
  echo "O exemplo ja foi importado. Nenhum arquivo foi alterado." >&2
  exit 1
fi

echo "1/3: adicionando esp-tflite-micro pelo ESP-IDF Component Manager..."
idf.py add-dependency "esp-tflite-micro"

component_dir="managed_components/espressif__esp-tflite-micro"
example_dir="$component_dir/examples/hello_world/main"

if [[ ! -d "$example_dir" ]]; then
  echo "Exemplo oficial nao encontrado em $example_dir." >&2
  echo "Confira se a dependencia foi baixada corretamente." >&2
  exit 1
fi

echo "2/3: preservando o firmware minimo como referencia..."
mv main/placeholder.cc main/placeholder.cc.etapa-2
mv main/CMakeLists.txt main/CMakeLists.txt.etapa-2

echo "3/3: copiando o Hello World oficial para main/..."
cp -a "$example_dir/." main/

echo "Importacao concluida. Agora execute: idf.py set-target esp32s3 && idf.py build"

