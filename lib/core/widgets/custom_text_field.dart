import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.textInputType, this.icon});

  final String hintText;
  final TextInputType textInputType;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E)
        ),
        suffixIcon: icon,
        filled: true,
        fillColor: const Color(0xFFE6E9E9),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder()
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0xFFE6E9E9)
        ),
      );
  }
}