// não deve criar um pedido com CPF inválido - Ok
//	→ CPF válido 264.310.820-52
// deve criar um pedido com 3 itens - Ok
// ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item - Ok
// deve apresentar a soma de um item corretamente - Ok
// deve permitir desconto do item de no máximo 15%
// deve apresentar o total do pedido corretamente
// deve validar e calcular o desconto de um cupom de desconto
// deve adicionar um cupom de desconto

import 'package:aulaum/entidade/pedido.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Não deve criar pedido com CPF inválido.", () {
    expect(() => Pedido(cpf: "123"), throwsException);
  });

  test("Deve criar um pedido com 3 itens.", () {
    var pedido = Pedido(cpf: "123.456.789-10");
    pedido.addItem(
      nomeProduto:"Guaraná",
      quantidade:2,
      precoUnidade:6.5);
    pedido.addItem(
      nomeProduto:"Fandangos",
      quantidade:1,
      precoUnidade:7.5);
    pedido.addItem(
      nomeProduto: "Bala Halls", 
      quantidade: 3, 
      precoUnidade: 6);
    expect(pedido.contarItem(),3);
  });

    test("Ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item.", () {
    var pedido = Pedido(cpf: "123.456.789-10");
    pedido.addItem(
    nomeProduto: "Guaraná", 
    quantidade: 2, 
    precoUnidade: 6.5);
    pedido.addItem(
    nomeProduto: "Guaraná", 
    quantidade: 1, 
    precoUnidade: 3.75);
    pedido.addItem(
    nomeProduto: "Bala Halls", 
    quantidade: 3, 
    precoUnidade: 6);
    expect(pedido.contarItem(), 2);
  });

    test("Deve Apresentar a soma de um item corretamente.",() {
    var pedido = Pedido(cpf: "123.456.789-10");
    var totalItem = pedido.addItem(nomeProduto: "Guaraná", quantidade: 2, precoUnidade: 6.5);
    expect(totalItem, 13.0);
  });

    test("Deve permitir desconto em reais do item de no máximo 15%.",() {
    var pedido = Pedido(cpf: "123.456.789-10");
    expect(() => pedido.addItem(
      nomeProduto: "Guaraná", 
      quantidade: 2, 
      precoUnidade: 6.5,
      descontoReais: 3
    ), throwsException);  
    expect(() => pedido.addItem(
        nomeProduto: "Bala Halls",
        quantidade: 2,
        precoUnidade: 5,
        descontoReais: 1.5),
    8.5);
  });

  test("Deve apresentar o total do pedido corretamente.", () {
    var pedido = Pedido(cpf: "123.456.789-10");
    pedido.addItem(
            nomeProduto: "Guaraná",
            quantidade: 2,
            precoUnidade: 10,
            descontoReais: 1); //12
    pedido.addItem(
            nomeProduto: "Bala Halls",
            quantidade: 2,
            precoUnidade: 5,
            descontoReais: 1.5); //8.5
    expect(pedido.getTotal(), 27.5);
  });
}
