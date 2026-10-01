# 5. Análise breve do código

Use esta sequência para escrever o relatório pedido na atividade.

1. **Modelo:** o arquivo `*_model_data.cc` é o modelo TFLite convertido para array.
   Ele não é o algoritmo de inferência; é apenas dado binário incorporado ao firmware.
2. **Modelo carregado:** o programa lê esse array por meio de `GetModel()`.
3. **Operadores:** o resolver registra somente as operações necessárias pelo modelo.
   Isso reduz memória e tamanho do binário.
4. **Arena de tensores:** uma área fixa de memória é reservada para entradas, saídas
   e tensores temporários. TFLite Micro evita alocação dinâmica.
5. **Inferência:** a aplicação preenche o tensor de entrada, chama `Invoke()` e lê
   o tensor de saída.
6. **Quantização:** valores podem ser armazenados como inteiros e convertidos usando
   escala e zero point. Isso reduz custo de memória e processamento.

## Texto-base para adaptar

> O Hello World demonstra a inferência embarcada com um modelo compacto que aproxima
> a função seno. O modelo é convertido para um array C/C++ e compilado com o firmware.
> Em tempo de execução, o MicroInterpreter organiza os tensores em uma arena de memória
> estática, recebe uma entrada e produz uma saída. Essa organização é adequada a
> microcontroladores pois evita treinamento e alocação dinâmica no dispositivo.

Complete o relatório com sua captura de tela, a versão do ESP-IDF usada e suas próprias
observações sobre tamanho do binário, velocidade ou valores no monitor serial.
