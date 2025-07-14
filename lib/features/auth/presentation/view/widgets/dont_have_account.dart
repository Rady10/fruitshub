import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
              fontFamily: 'Cairo'
            ),
          ),
          TextSpan(
            text: '  قم بانشاء حساب',
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