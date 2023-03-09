import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var campoCPF = TextEditingController();
  var campoCNPJ = TextEditingController();


  String validarCPF(String cpfCompleto) {
    if (!cpfCompleto.contains('.')) return 'CPF deve conter "."!';
    if (!cpfCompleto.contains('-')) return 'CPF deve conter "-"!';
    if (cpfCompleto.length != 14) return 'CPF deve conter 14 caracteres!';


    //temp temp2 = cpfLimpo
    //temp3 = lista de caracteres
    //temp e temp2 eram para formatar o cpf se nao estivesse com . ou -
    //temp4 = numeros em sequencias iguais = 555 ou 222
    //temp 5 é a lista de numeros
    //temp7 é o peso
    //temp8 é o digito calculado
    //temp10 é o primeiro digito
    //temp 12 = peso

    var cpfLimpo = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfListaNumeros = cpfLimpo
        .substring(0, 9)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();
    var ehNumerosIguais = true;
    var primeiroDigito = int.parse(cpfLimpo.substring(9,10));
    var segundoDigito = int.parse(cpfLimpo.substring(10,11));

    for (var i = 1; i < cpfListaNumeros.length; i++) {
      var numeroAnterior = cpfListaNumeros[i - 1];
      var numeroAtual = cpfListaNumeros[i];

      if (numeroAnterior != numeroAtual) {
        ehNumerosIguais = false;
        break;
      }
    }
    if (ehNumerosIguais) return "CPF deve possuir números diferentes!";

    var peso = 10;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado = peso * n + digitoCalculado;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) return "Primeiro digito incorreto!";
    cpfListaNumeros.add(digitoCalculado);
    peso = 11;
    digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (segundoDigito != digitoCalculado) return "Segundo digito incorreto!";

    return 'CPF Válido!';
}

//===================Validar CNPJ agora=======================

  String validarCNPJ(String cnpjCompleto) {
    if (!cnpjCompleto.contains('.')) return 'CNPJ deve conter "."!';
    if (!cnpjCompleto.contains('-')) return 'CNPJ deve conter "-"!';
    if (!cnpjCompleto.contains('/')) return 'CNPJ deve conter "/"!';
    if (cnpjCompleto.length != 18) return 'CNPJ deve conter 18 caracteres!';

    var cpfLimpo = cnpjCompleto.replaceAll('.', '').replaceAll('-', '').replaceAll('/', '');
    var cpfListaNumeros = cpfLimpo
        .substring(0, 12)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();
    var ehNumerosIguais = true;
    var primeiroDigito = int.parse(cpfLimpo.substring(12, 13));
    var segundoDigito = int.parse(cpfLimpo.substring(13, 14));

    for (var i = 1; i < cpfListaNumeros.length; i++) {
      var numeroAnterior = cpfListaNumeros[i - 1];
      var numeroAtual = cpfListaNumeros[i];

      if (numeroAnterior != numeroAtual) {
        ehNumerosIguais = false;
        break;
      }
    }
    if (ehNumerosIguais) return "CNPJ deve possuir números diferentes!";

    var peso = 5;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado = peso * n + digitoCalculado;
      peso--;
      if (peso == 1){
        peso = 9;
      }
    }

    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) return "Primeiro digito incorreto!";
    cpfListaNumeros.add(digitoCalculado);
    peso = 6;
    digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
        if (peso == 1){
        peso = 9;
      }
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (segundoDigito != digitoCalculado) return "Segundo digito incorreto!";

    return 'CPF Válido!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeria Página')),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  label: Text('CNPJ'), hintText: 'Informe o seu CNPJ'),
              controller: campoCNPJ,
            ),
            ElevatedButton(
              child: const Text('Verificar CPF'),
              onPressed: () {
                var resultado = validarCNPJ(campoCNPJ.text);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Aviso'),
                        content: Text(resultado),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}