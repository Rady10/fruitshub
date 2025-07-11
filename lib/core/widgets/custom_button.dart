import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorPallete.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
        ), 
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}