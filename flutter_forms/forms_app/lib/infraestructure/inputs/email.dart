import 'package:formz/formz.dart';

enum EmailError { empty, emailFormat }

class Email extends FormzInput<String, EmailError> {
  static final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  const Email.pure() : super.pure('');
  const Email.dirty({ required String value }) : super.dirty(value);
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty ) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.emailFormat;
    return null;
  }
   String? get errorMessage{
    if ( isValid || isPure ) return null;
    if ( displayError == EmailError.empty ) return "El campo es requerido";
    if ( displayError == EmailError.emailFormat ) return "El email no es formato valido";
    return null;
  }
}