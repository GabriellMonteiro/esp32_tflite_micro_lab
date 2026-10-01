# Relatório breve — Hello World com TensorFlow Lite Micro

Nesta atividade eu executei o exemplo Hello World do TensorFlow Lite Micro em um
ESP32-S3 simulado no Wokwi. O objetivo do exemplo é usar um modelo pequeno para
aproximar a função seno. A entrada é um valor de `x` e a saída é o valor de `y`
calculado pelo modelo.

O modelo original está no formato `.tflite`, que é um arquivo próprio para modelos
mais leves. Para poder usar esse modelo no microcontrolador, ele foi transformado
em um arquivo C++ chamado `model.cc`. Dessa forma, os dados do modelo ficam junto
com o firmware e não é necessário acessar arquivos externos durante a execução.

No código, o `MicroInterpreter` é a parte que prepara e executa o modelo. Primeiro,
ele organiza a memória necessária para os dados de entrada, saída e cálculos
intermediários. Essa memória é reservada em uma área fixa chamada arena de tensores.
Esse tipo de organização é importante em microcontroladores, que possuem memória
mais limitada e normalmente não utilizam alocação dinâmica como em computadores.

Em cada repetição do programa, um novo valor de `x` é colocado no tensor de entrada.
Depois, o método `Invoke()` executa a inferência. Por fim, o programa lê o tensor de
saída e apresenta no monitor serial os valores `x_value` e `y_value`.

Na simulação, foi possível observar que o `y_value` varia de forma parecida com uma
onda seno: começa próximo de zero, cresce até valores positivos, volta próximo de
zero e depois apresenta valores negativos. Isso mostra que o modelo foi executado
corretamente no ESP32-S3 virtual.

O exemplo ajudou a entender que o TensorFlow Lite Micro é voltado para inferência em
dispositivos embarcados. O treinamento do modelo é feito fora do microcontrolador;
o ESP32 recebe somente o modelo já pronto para calcular previsões com baixo uso de
memória e processamento.

