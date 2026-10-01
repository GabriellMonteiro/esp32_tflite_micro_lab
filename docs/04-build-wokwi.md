# 4. Build e simulação do TensorFlow Lite Micro

Após importar o exemplo:

```bash
idf.py set-target esp32s3
idf.py build
```

No Wokwi, execute `Wokwi: Start Simulator`.

O arquivo `wokwi.toml` aponta para:

- `build/flasher_args.json`: imagens a carregar no ESP32 virtual;
- `build/esp32_tflite_micro_lab.elf`: símbolos e firmware para a simulação.

O `diagram.json` tem apenas o ESP32-S3 e o monitor serial porque o Hello World
recebe um número programaticamente; não há sensor físico nesta etapa.

## Resultado esperado

O texto exato varia entre versões do exemplo, mas a saída deve repetir pares como:

```text
x_value: ... * 2^...
y_value: ... * 2^...
```

Eles representam respectivamente a entrada e a saída inferida, aproximando a função
seno. Faça um print do Wokwi com esse monitor serial aberto.
