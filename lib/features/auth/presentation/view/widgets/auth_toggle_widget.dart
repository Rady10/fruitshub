import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';

class AuthToggleTextWidget extends StatelessWidget {
  const AuthToggleTextWidget({
    super.key, required this.firstText, required this.secondText, required this.onPressed,
  });

  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
              fontFamily: 'Cairo'
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            text: secondText,
            style: TextStyles.semiBold16.copyWith(
              color: Pallete.primaryColor,
              fontFamily: 'Cairo'
            ),
          ),
        ]
      )
    );
  }
}