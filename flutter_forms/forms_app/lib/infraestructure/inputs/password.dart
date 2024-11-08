import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');
  const Password.dirty({ required String value }) : super.dirty(value);
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    return null;
  }
  String? get errorMessage{
    if ( isValid || isPure ) return null;
    if ( displayError == PasswordError.empty ) return "El campo es requerido";
    if ( displayError == PasswordError.length ) return "El campo necesita mas caracteres";
    return null;
  }
}