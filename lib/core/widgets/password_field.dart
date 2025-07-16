import 'package:flutter/material.dart';
import 'package:fruitshub/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: _isObscured,
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
      icon: GestureDetector(
        onTap: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        child: Icon(
          _isObscured ? Icons.remove_red_eye : Icons.visibility_off,
          color: const Color(0xffC9CECF),
        ),
      ),
    );
  }
}