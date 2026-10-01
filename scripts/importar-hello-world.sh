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

echo "1/4: adicionando esp-tflite-micro pelo ESP-IDF Component Manager..."
if [[ -f main/idf_component.yml ]] && grep -qE '^[[:space:]]+espressif/esp-tflite-micro:' main/idf_component.yml; then
  echo "Dependencia ja registrada no manifesto; mantendo a configuracao existente."
else
  idf.py add-dependency "esp-tflite-micro"
fi

echo "2/4: baixando a dependencia e os exemplos oficiais..."
# O add-dependency apenas atualiza o manifesto. A reconfiguracao resolve e baixa
# o componente para managed_components/, onde o exemplo hello_world fica disponivel.
idf.py reconfigure

component_dir="managed_components/espressif__esp-tflite-micro"
example_dir="$component_dir/examples/hello_world/main"
tflite_cmake="$component_dir/CMakeLists.txt"

if [[ ! -d "$example_dir" ]]; then
  echo "Exemplo oficial nao encontrado em $example_dir." >&2
  echo "Confira se a dependencia foi baixada corretamente." >&2
  exit 1
fi

if grep -qE '^[[:space:]]*target_compile_options\(\$\{COMPONENT_LIB\} PRIVATE -DESP_NN\)' "$tflite_cmake"; then
  echo "Desabilitando ESP-NN para compatibilidade com o Wokwi..."
  sed -i '/target_compile_options.*-DESP_NN/s/^/# /' "$tflite_cmake"
fi

echo "3/4: preservando o firmware minimo como referencia..."
mv main/placeholder.cc main/placeholder.cc.etapa-2
mv main/CMakeLists.txt main/CMakeLists.txt.etapa-2

echo "4/4: copiando o Hello World oficial para main/..."
cp -a "$example_dir/." main/

echo "Importacao concluida. Agora execute: idf.py set-target esp32s3 && idf.py build"
