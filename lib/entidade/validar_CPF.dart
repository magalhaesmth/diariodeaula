class ValidarCPF{

  bool ehVazio (String cpf){
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio!');
    return true;
  }

  ehTamanhoCorreto (String cpf) {
    if(cpf.length != 14) 
      throw Exception('CPF deve possuir 14 caracteres');
    return true;
  }

  bool ehFormatoCorreto(String cpf) {
    var regExp = RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}');
    if (!regExp.hasMatch(cpf))
      throw Exception('CPF deve possuir o formato valido. Ex: 123.123.123-12');
    return true;
  }

  List<int> gerarListaNumero(String cpfCompleto) {
    ehVazio(cpfCompleto);
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfSemDigito = cpfSemMascara.substring(0, 9);
    List<String> listaCaracteres = cpfSemDigito.split('');
    List<int> listaNumeros = listaCaracteres.map<int>((elemento)=>int.parse(elemento)).toList();
    return listaNumeros;
  }
}