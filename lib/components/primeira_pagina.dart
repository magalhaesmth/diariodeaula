import 'package:aulaum/components/campo_showdialog.dart';
import 'package:aulaum/components/cpf_validador.dart';
import 'package:flutter/material.dart';


//Centralizei o titulo e o textfield
//Criação de componentes genéricos
//Cor selecionada na main agora funcionando

class PrimeiraPagina extends StatelessWidget {
  final cpfControlador = TextEditingController();

AlertaDialog alertaDialog = AlertaDialog();
Validador validador = Validador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validador de CPF"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: cpfControlador,
              decoration: const InputDecoration(
                label: Text("Número do CPF"),
                hintText: "Informe o CPF",
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                final cpf = cpfControlador.text;
                alertaDialog.showAlertDialog(cpf, context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
