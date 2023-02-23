import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget {
  final Key? key;
  const PrimeiraPagina({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validador de CPF"),
        centerTitle: true, //Centralizei o titulo do appbar
      ),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: const Text("Número do CPF"),
                hintText: "Informe o CPF",
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                showAlertDialog(
                    context: context,
                    titulo: 'CPF informado',
                    comentario: 'Seu CPF não é válido');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

Future showAlertDialog(
    {required BuildContext context,
    required String titulo,
    required String comentario}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(comentario),
        );
      });
}
