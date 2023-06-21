# Código de Renomear Arquivo

Este é um código em Assembly x86_64 que utiliza chamadas de sistema para renomear um arquivo. Ele recebe dois argumentos da linha de comando: o nome atual do arquivo e o novo nome que será atribuído a ele. 

## Funcionamento

O código primeiro verifica se foram passados exatamente três argumentos (incluindo o nome do programa). Caso contrário, exibe uma mensagem de erro informando que a quantidade de argumentos é inválida e encerra o programa com um código de saída 1.

Se a quantidade de argumentos for correta, o código prossegue obtendo o nome atual e o novo nome do arquivo da pilha. Em seguida, utiliza a chamada de sistema `SYS_RENAME` para renomear o arquivo.

Após a renomeação, o programa encerra com um código de saída 0, indicando sucesso.

## Uso

Para utilizar este código, você pode montá-lo e ligá-lo com um compilador de Assembly adequado. Aqui está um exemplo utilizando o NASM e o ld, executando ele logo em seguida:

```nasm -felf64 rename.asm && ld rename.o -o rename && ./rename```

Caso ocorra algum erro, como uma quantidade inválida de argumentos, uma mensagem de erro será exibida e o programa será encerrado com um código de saída 1.

## Atenção

Este código é apenas um exemplo didático e pode não lidar com todos os casos de erro possíveis.
