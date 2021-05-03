class Validations {
  String email(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return !regex.hasMatch(value) ? 'Por favor, insira um email válido.' : null;
  }

  String celular(String value) {
    return value.length != 15
        ? 'Por favor, preencha corretamente este campo.'
        : null;
  }

  String cep(String value) {
    return value.length != 10
        ? 'Por favor, preencha corretamente este campo.'
        : null;
  }

  String defaultValidate(String value) {
    return value?.isEmpty ?? true
        ? 'Por favor, preencha corretamente este campo.'
        : null;
  }
}
