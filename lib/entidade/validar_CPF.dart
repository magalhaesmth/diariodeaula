class ValidarCPF {
  ValidarCPF(String cpf){
    ehVazio(cpf);
    ehFormatoCorreto(cpf);
    ehTamanhoCorreto(cpf);
  }

  bool ehVazio(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio!');
    return true;
  }

  ehTamanhoCorreto(String cpf) {
    if (cpf.length != 14) throw Exception('CPF deve possuir 14 caracteres');
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
    List<int> listaNumeros =
        listaCaracteres.map<int>((elemento) => int.parse(elemento)).toList();
    return listaNumeros;
  }

  validarPrimeiroDigito(String cpf) {
    var peso = 10;
    var digitoCalculado = 0;
    var cpfLimpo = cpf.replaceAll('.', '').replaceAll('-', '');
    var primeiroDigito = int.parse(cpfLimpo.substring(9, 10));

    for (var n in gerarListaNumero(cpf)) {
      digitoCalculado += peso * n;
    }

    digitoCalculado = 11 - (digitoCalculado % 11);
    if (primeiroDigito > 9) digitoCalculado = 0;

    return primeiroDigito;
  }

  validarSegundoDigito(String cpf) {
    List<int> listaCPF = gerarListaNumero(cpf);
    listaCPF.add(validarPrimeiroDigito(cpf));

    var peso = 11;
    var digitoCalculado = 0;

    for (var n in listaCPF) {
      digitoCalculado += peso * n;
      peso--;
    }

    var cpfsemMascara = cpf.replaceAll('.', '').replaceAll('-', '');
    var digito = int.parse(cpfsemMascara.substring(10, 11));

    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digito > 10) digitoCalculado = 0;

    return digito;
  }

  bool validarDigitos(String cpf) {
    var cpfsemMascara = cpf.replaceAll('.', '').replaceAll('-', '');
    var primeiroDigito = int.parse(cpfsemMascara.substring(9, 10));
    var segundoDigito = int.parse(cpfsemMascara.substring(10, 11));

    if (primeiroDigito != validarPrimeiroDigito(cpf))
      throw Exception('Primeiro digito incorreto');

    if (segundoDigito != validarSegundoDigito(cpf))
      throw Exception('Segundo digito incorreto');

    return true;
  }
}
