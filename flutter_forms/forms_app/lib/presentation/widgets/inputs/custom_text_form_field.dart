import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  const CustomTextFormField(
      {
        super.key,
        this.label,
        this.hint,
        this.errorMessage,
        this.onChanged,
        this.validator,
        this.obscureText = false
      }
  );

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      //borderSide: BorderSide(color: colors.primary),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: const Icon(Icons.person_pin_circle_outlined),
        errorText: errorMessage,
        errorBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        

      ),
    );
  }
}
