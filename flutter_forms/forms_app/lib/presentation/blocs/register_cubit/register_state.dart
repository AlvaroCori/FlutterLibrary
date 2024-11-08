part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;
  const RegisterFormState({
    this.username = const Username.pure(), 
    this.email = const Email.pure(), 
    this.isValid = false,
    this.password = const Password.pure(), 
    this.formStatus = FormStatus.invalid,
  });
  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
  }) => RegisterFormState(
    email: email ?? this.email,
    username: username ?? this.username,
    formStatus: formStatus ?? this.formStatus,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
  );
  @override
  List<Object> get props => [ formStatus, username, email, password ];
}
