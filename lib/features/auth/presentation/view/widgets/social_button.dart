import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.text, required this.image, required this.onPressed});

  final String text;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Color(0xffDCDEDE),
              width: 1
            ),
          ),
        ), 
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            text,
            style: TextStyles.semiBold16.copyWith(
              color: Colors.black
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}