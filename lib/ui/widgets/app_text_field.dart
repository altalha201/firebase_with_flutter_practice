import 'package:flutter/material.dart';

import '../utility/application_colors.dart';

class AppTextField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxLine;
  final bool? readOnly;
  final Function(String?)? validator;

  const AppTextField({
    Key? key,
    required this.hint,
    this.obscureText,
    required this.controller,
    this.validator,
    this.maxLine,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      readOnly: readOnly ?? false,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApplicationColor.colorBlue, width: 1),
          ),
          fillColor: ApplicationColor.colorWhite,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApplicationColor.colorWhite, width: 0.0),
          ),
          border: const OutlineInputBorder(),
          labelText: hint
      ),
    );
  }
}
