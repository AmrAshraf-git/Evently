import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isObscure;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;

  const MyTextFormField({
    super.key,
    this.textEditingController,
    this.validator,
    this.textInputType=TextInputType.text,
    this.prefixIcon, this.suffixIcon,
    required this.hint,
    this.isObscure=false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: textEditingController,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),

    );
  }
}
