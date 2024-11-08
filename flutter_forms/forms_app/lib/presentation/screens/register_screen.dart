import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

import '../widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 100),
              _RegisterForm(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  _RegisterForm();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final userName = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre de usuario",
            onChanged: (value) {
              registerCubit.usernameChanged(value);
            },
            errorMessage: userName.errorMessage,
            validator: (value) {
              
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: "Correo electronico",
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: "Contraseña",
            obscureText: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
            },
            errorMessage: password.errorMessage,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            label: const Text("Guardar"),
            onPressed: () {
              //final isValid = _formKey.currentState!.validate();
              //if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
