import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/features/auth/presentation/view/signup_view.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChecked});

  final ValueChanged<bool> onChecked;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  bool isTremsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTremsAccepted,
          onChecked: (value) {
            setState(() {
              widget.onChecked(value);
              isTremsAccepted = value;
            });
          },
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                    fontFamily: 'Cairo'
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.of(context).pushNamed(SignupView.routeName);
                  },
                  text: ' الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: Pallete.lightPrimaryColor,
                    fontFamily: 'Cairo'
                  ),
                ),
              ]
            )
          ),
        )
      ],
    );
  }
}