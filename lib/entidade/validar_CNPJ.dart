class ValidarCnpj {
  bool ehvazio(String cnpj) {
    if (cnpj.isEmpty) throw Exception('CNPJ não pode ser vazio');
    return true;
  }

  bool validarQuantidadeCaracteres(String cnpj) {
    if (cnpj.length != 18) throw Exception('CNPJ menor que 18');
    return true;
  }

  bool validarFormato(String cnpj) {
    var regExp = RegExp(r'\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}');
    if (!regExp.hasMatch(cnpj))
      throw Exception('CNPJ deve possuir o formato basico');

    return true;
  }

  List<int> gerarListaNumero(String cnpj) {
    ehvazio(cnpj);
    cnpj = cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');

    List<int> listaNumerosCNPJ =
        cnpj.substring(0, 12).split('').map<int>((e) => int.parse(e)).toList();

    return listaNumerosCNPJ;
  }

  int validarPrimeiroDigito(String cnpj) {
    var peso = 5;
    var digitoCalculado = 0;

    for (var n in gerarListaNumero(cnpj)) {
      digitoCalculado += peso * n;
      peso--;

      if (peso == 1) {
        peso = 9;
      }
    }

    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;

    var cnpjSemMascara =
        cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');

    var digito = int.parse(cnpjSemMascara.substring(12, 13));

    return digito;
  }

  int validarSegundoDigito(String cnpj) {
    List<int> listaNumerosCNPJ = gerarListaNumero(cnpj);
    listaNumerosCNPJ.add(validarPrimeiroDigito(cnpj));

    var peso = 6;
    var digitoCalculado = 0;

    for (var n in listaNumerosCNPJ) {
      digitoCalculado += peso * n;
      peso--;

      if (peso == 1) {
        peso = 9;
      }
    }

    var cnpjSemMascara =
        cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
    var digito = int.parse(cnpjSemMascara.substring(13, 14));

    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digito > 10) digitoCalculado = 0;

    return digito;
  }

  bool validarDigitos(String cnpj) {
    var cnpjSemMascara =
        cnpj.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
    var primeiroDigito = int.parse(cnpjSemMascara.substring(12, 13));
    var segundoDigito = int.parse(cnpjSemMascara.substring(13, 14));

    if (primeiroDigito != validarPrimeiroDigito(cnpj))
      throw Exception('Primeiro digito incorreto');
    if (segundoDigito != validarSegundoDigito(cnpj))
      throw Exception('Segundo digito incorreto');

    return true;
  }
}
