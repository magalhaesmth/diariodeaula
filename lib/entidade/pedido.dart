import 'package:aulaum/entidade/validar_CPF.dart';

class Pedido{
  var itens = <Object>[]; //Criando uma lista de itens
  var total = 0.0;
  Pedido({required String cpf}){
    ValidarCPF(cpf);
  }

  double addItem({required String nomeProduto, required int quantidade, required double precoUnidade, double descontoReais=0}) {
    var existe = false;
    var totalItem = quantidade * precoUnidade;
    var descontoPermitido = totalItem * 0.15;
    if(descontoReais > descontoPermitido) throw Exception("Desconto maior do que o permitido!");
    totalItem = totalItem - descontoReais;

    for(var contador=0; contador < itens.length; contador ++){
      var item = itens[contador] as List<Object>;  //O item entra como Object, qualquer coisa. No List ele pega só os objetos definidos
      if(item[0] == nomeProduto){
        item[1] = quantidade + int.parse(item[1].toString());
        existe = true;
        break;
      }
    }
    if(!existe){
      itens.add([nomeProduto, quantidade, precoUnidade]);  //Array de itens, e o itens é um Array. Um Array de Array, uma Matriz.
      } 
      total += totalItem; 
      return totalItem;
  }

  int contarItem() {
    return itens.length; //Contando os itens
  }

  getTotal() {
    return total;
  }
}