import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: const Color(0xffeeeeee)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Pallete.primaryColor
                ),
                child: Center(child: SvgPicture.asset(image)),
              ),
              const SizedBox(width: 4,),
              Text(
                text,
                style: TextStyles.semiBold11.copyWith(
                  color: Pallete.primaryColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}