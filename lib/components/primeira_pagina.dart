import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget{
  final Key? key;
  const PrimeiraPagina({this.key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Projetinho de clonar cartão")),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: const Text("Número do cartão"),
                hintText: "Informe o número do cartão",
              ),
            ),
            ElevatedButton(
              onPressed: (){
                showDialog(
                 context: context,
                 builder: (BuildContext context) {
                   return AlertDialog(
                    title: Text ("Resultado"),
                    content: Text ("Cartão clonado"),
                   );
                 }
                );
              },
               child: const Text("Ok"),
               )
          ],
        ),
      ),
    );
  }
}