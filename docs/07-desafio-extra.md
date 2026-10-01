# 7. Desafio extra: nova aplicação

A atividade permite ir além do Hello World, mas exige uma aplicação nova com sensor e
dataset próprios — não apenas outro exemplo pronto da biblioteca.

Um caminho progressivo é:

1. Escolha uma grandeza de sensor, como temperatura, luminosidade ou aceleração.
2. Colete ou encontre um dataset com entradas compatíveis.
3. Treine e avalie um modelo pequeno no computador.
4. Converta para `.tflite`, preferencialmente com quantização.
5. Transforme o modelo em array C/C++ usando `xxd -i`.
6. Troque o modelo do Hello World e adapte entrada, saída, operadores e arena.
7. Simule o sensor e registre os resultados no Wokwi.

Não comece pelo desafio. Primeiro entregue o Hello World funcionando: ele fornece a
referência para saber se um erro vem do ambiente, do modelo ou da integração com sensor.
