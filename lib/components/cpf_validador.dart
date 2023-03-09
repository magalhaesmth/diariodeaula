 import 'package:flutter/material.dart';

class Validador extends StatelessWidget {
  const Validador({Key? key}) : super(key: key);


String validar(String cpf){
    if(!cpf.contains('.')) return "CPF não tem ponto!";
    if (!cpf.contains('-')) return "CPF não tem traço!";
    if (cpf.length < 14) return "CPF com tamanho invalido";
    var cpfSemSimbolos = cpf.replaceAll('.', '').replaceAll('-', '');
    if(RegExp('([1-9]+)\1(10)').hasMatch(cpfSemSimbolos)) return "CPF com números iguais";



    var temp, temp2,temp3,temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15;

            temp4 = true;

            temp5 = temp2.substring(0,9).split('').map(int.parse).toList();
            temp6 = 0;
            temp7 = 10;
            temp8 = 0;
            for(var n in temp5){
              temp8 = temp7 * n + temp8;
              temp7--;
            }
            temp9 =  11 - (temp8 % 11);
            if( temp9 > 9){
              temp9 = 0;
            }else{
              temp9 = temp9;
            }
            temp10 = int.parse(cpf.substring(12,13));
            if(temp9 == temp10){
              temp11 = temp2.substring(0,10).split('').map(int.parse).toList();
              temp12 = 11;
              temp13 = 0;
              for(var n in temp11){
                temp13 = temp12 * n + temp13;
                temp12--;
              }
              temp14 =  11 - (temp13 % 11);
              if( temp14 > 9){
                temp14 = 0;
              }else{
                temp14 = temp14;
              }
              temp15 = int.parse(cpf.substring(13,14));
              if(temp14 == temp15){
                return 'CPF válido';
              }else{
                return 'CPF inválido';
              }
            }else{
              return 'CPF inválido';
            }
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
                label: Text('CPF'), 
                hintText: 'Informe o seu CPF'
              ),
              onChanged: (valorDigitado){
                print(valorDigitado);
              },
            ),
            ElevatedButton(
              child: const Text('verificar'),
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return const AlertDialog(  
                      title: Text('Aviso'),
                      content: Text('Mensagem...'),
                    );
                  }
                );
              }, 
            )
          ],
        ),
      ),
    );
  }
}