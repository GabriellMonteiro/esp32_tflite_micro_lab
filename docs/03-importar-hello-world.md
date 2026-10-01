# 3. Importar o Hello World oficial

Com a etapa anterior concluída, na raiz do projeto e dentro do Dev Container execute:

```bash
./scripts/importar-hello-world.sh
```

O script faz quatro operações visíveis:

1. Executa `idf.py add-dependency "esp-tflite-micro"`.
2. Executa `idf.py reconfigure` para baixar a dependência em `managed_components/`.
3. Guarda o firmware e o CMake da etapa 2 com o sufixo `.etapa-2`.
4. Copia para `main/` os arquivos do exemplo oficial `hello_world`.

A dependência é baixada em `managed_components/`; ela não deve entrar no Git.

## O que mudou?

O firmware mínimo é substituído por um programa C++ que usa o runtime TFLite Micro e
um modelo quantizado que aproxima `sin(x)`. O exemplo é apropriado para começar
porque tem uma entrada e uma saída, sem sensor nem dataset externo.

## Sobre o arquivo do modelo

Um modelo `.tflite` é um FlatBuffer binário. Para ficar embutido no firmware, ele é
transformado em um array C/C++. O comando didático é:

```bash
xxd -i converted_model.tflite > model_data.cc
```

O exemplo oficial já fornece esse arquivo convertido. Evite editá-lo manualmente.
