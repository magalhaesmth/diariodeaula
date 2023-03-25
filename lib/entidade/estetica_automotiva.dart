import 'package:aulaum/components/cpf_validador.dart';
import 'package:aulaum/entidade/validar_CPF.dart';

class EsteticaAutomotiva{

  Validador validarCPF = Validador();
  
  String Validar(String cpf){
    return validarCPF.validar(cpf);
  }

  EsteticaAutomotiva({required String cpf}) {
    Validar(cpf);
  }

  bool validarPlacaModelo(String placa, String modelo){
    if (placa.isNotEmpty && modelo.isNotEmpty) {
      return true;
    }
    return false;
  }
}