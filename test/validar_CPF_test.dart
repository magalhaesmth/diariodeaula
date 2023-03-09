/*
1 - Escreva o teste antes
2 - Não escreva mais código que o necessario 
3 - Não escreva mais testes antes de codificar
*/

import 'package:aulaum/entidade/validar_CPF.dart';
import 'package:flutter_test/flutter_test.dart';

//CPF não pode ser vazio
//

void main() {
  test(
    'CPF não pode ser vazio',
    (){
      String cpf = '';
      var validarCPF = ValidarCPF();
      expect(()=>validarCPF.ehVazio(cpf), throwsException);
    }
  );

  test(
    'CPF deve possuir 14 caracteres',
    (){
      String cpf = '111.111.111-11';
      var validarCPF = ValidarCPF();
      expect(()=>validarCPF.ehTamanhoCorreto(cpf), true);
      cpf = '1111';
      expect(()=> validarCPF.ehTamanhoCorreto(cpf), throwsException);
    }
  );

  test('CPF deve possuir formato correto', () {
    String cpf = '111.111.111-11';
    var validarCPF = ValidarCPF();
    expect(validarCPF.ehFormatoCorreto(cpf), true);
    cpf = '1111';
    expect(() => validarCPF.ehFormatoCorreto(cpf), throwsException);
});

  test('CPF sem máscara e sem digito devem possuir 9 caracteres', () {
    String cpf = '123.456.789-10';
    var validarCPF = ValidarCPF();
    List<int> listaNumerosCPF = validarCPF.gerarListaNumero(cpf);
    expect(listaNumerosCPF.length, 9);
    cpf = '1111';
  });
}