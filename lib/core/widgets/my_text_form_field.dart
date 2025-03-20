import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

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
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.darkGray,)
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon, 
        

      ),

    );
  }
}
