import 'package:flutter/material.dart';

class AlertaDialog {

Future showAlertDialog(String cpf, BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('CPF Informado'),
          content: Text(cpf),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
}
