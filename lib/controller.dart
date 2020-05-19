import 'package:mobx/mobx.dart';

import 'client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null && validateCpf() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.name.length < 3) {
      return "O nome precisa ter mais de 3 caracteres";
    }

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!client.email.contains('@')) {
      return "Email inválido";
    }

    return null;
  }

  String validateCpf() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.cpf.length < 11 || client.cpf.length > 11) {
      return "CPF inválido";
    }

    return null;
  }

  dispose() {}
}