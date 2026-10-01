# 2. Firmware mínimo: validar antes do ML

Antes de adicionar TensorFlow Lite Micro, valide a infraestrutura. O arquivo
`main/placeholder.cc` só escreve duas mensagens no serial.

No terminal do Dev Container:

```bash
idf.py build
```

Depois, no VS Code, abra a paleta de comandos e execute:

```text
Wokwi: Start Simulator
```

## Resultado esperado

O monitor serial deve apresentar mensagens parecidas com:

```text
I (...) LAB: Etapa 2 concluida: ESP-IDF + Wokwi estao funcionando.
I (...) LAB: Proxima etapa: execute ./scripts/importar-hello-world.sh
```

Se esta etapa falhar, resolva-a antes de trazer a biblioteca de ML. Isso separa
problemas de ambiente de problemas de inferência.
