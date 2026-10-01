# Roteiro didático

A aprendizagem é dividida em camadas. Só avance após observar o resultado esperado.

| Etapa | O que você faz | O que comprova |
|---|---|---|
| 1 | Abre o Dev Container | O ambiente tem o ESP-IDF |
| 2 | Compila o firmware mínimo | O toolchain gera um firmware ESP32-S3 |
| 3 | Simula no Wokwi | O arquivo ELF e o monitor serial funcionam |
| 4 | Importa o exemplo oficial | O projeto passa a ter runtime, modelo e inferência |
| 5 | Compila e simula novamente | A saída mostra valores previstos pelo modelo seno |
| 6 | Analisa o código | Você explica o pipeline de inferência |
| 7 | Registra evidências | A entrega fica reprodutível |

## Mapa mental

```text
modelo .tflite
    ↓ convertido em array C/C++
dados do modelo → MicroInterpreter → tensor de entrada → Invoke() → tensor de saída
                                      ↑                                ↓
                                  valor x                         seno previsto
```

O exemplo oficial já inclui o modelo convertido. A etapa de conversão está explicada
na documentação para que você entenda de onde ele veio.
