 import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';

AppBar customAppBar(String text, context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new)
      ),
      centerTitle: true,
      title: Text(
        text, 
        style: TextStyles.bold19,
      ),
    );
}

