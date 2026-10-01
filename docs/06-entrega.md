# 6. Evidências e entrega

Salve suas capturas em `docs/evidencias/` com nomes claros:

- `01-esp-idf-version.png`: `idf.py --version` dentro do Dev Container;
- `02-wokwi-hello-world.png`: ESP32-S3 e monitor serial do Wokwi;
- `03-build-sucesso.png`: `idf.py build` concluído;
- `04-relatorio.md`: análise breve do código em suas palavras.

## Checklist

- [ ] Projeto aberto dentro do Dev Container
- [ ] Target configurado como `esp32s3`
- [ ] Firmware mínimo compilado e simulado
- [ ] `esp-tflite-micro` instalado pelo Component Manager
- [ ] Hello World oficial importado em `main/`
- [ ] Build concluído sem erros
- [ ] Wokwi mostrando a inferência
- [ ] Análise breve escrita
- [ ] Evidências salvas
- [ ] Repositório Git publicado, se solicitado

Não envie `build/` ou `managed_components/`; o ESP-IDF os recria.
