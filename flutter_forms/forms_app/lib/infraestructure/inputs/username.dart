import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {
  const Username.pure() : super.pure('');
  const Username.dirty({ required String value }) : super.dirty(value);
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty ) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;
    return null;
  }
  String? get errorMessage{
    if ( isValid || isPure ) return null;
    if ( displayError == UsernameError.empty ) return "El campo es requerido";
    if ( displayError == UsernameError.length ) return "El campo necesita mas caracteres";
    return null;
  }
}