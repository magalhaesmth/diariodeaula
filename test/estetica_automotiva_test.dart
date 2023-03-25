//1 - Para realizar o serviço, o cliente deve informar o CPF corretamente
//2 - Carro deve conter placa e modelo
//3 - O serviço só poderá ser agendado com a placa e CPF do cliente
//4 - Calcular serviço + custos
//5 - Um serviço deve ter uma estimativa de entrega
//6  - O pagamento só pode ser parcelado em até 2x
//7 - A cada 10 lavagens a próxima será gratuita
//8 -  Agendamento do serviço não poderá ser realizado sem mão de obra disponível
//9 - O veículo só poderá ser entregue após pagamento
//10 - Deve apresentar a soma total do serviço

import 'package:aulaum/entidade/estetica_automotiva.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  String cpf = "123";
  EsteticaAutomotiva validarPlacaModelo = EsteticaAutomotiva(cpf: cpf);

  test("Para realizar o serviço, o cliente não deve informar um CPF inválido", (){
    expect(() => EsteticaAutomotiva(cpf: "123"), throwsException);
  });

  test("Carro deve conter placa e modelo",() {
    String placa = "SDQ-7I59";
    String modelo = "Saveiro Trend 1.6";

    expect(validarPlacaModelo.validarPlacaModelo(placa, modelo), true);
  });

}