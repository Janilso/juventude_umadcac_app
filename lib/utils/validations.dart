class Validations {
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Por favor, insira um email válido.';
    else
      return null;
  }

  String validateCelular(String value) {
    if (value.length != 15)
      return 'Por favor, preencha corretamente este campo.';
    else
      return null;
  }

  String validateCep(String value) {
    if (value.length != 10)
      return 'Por favor, preencha corretamente este campo.';
    else
      return null;
  }

  String validateDefault(String value) {
    if (value.isEmpty)
      return 'Por favor, preencha corretamente este campo.';
    else
      return null;
  }
}
