import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChecked});

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? Pallete.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE)
            )
          )
        ),
        child: isChecked ? Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(Assets.imagesCheck),
        ) : const SizedBox()
      ),
    );
  }
}