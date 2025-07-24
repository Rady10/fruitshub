import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/notification_widget.dart';

AppBar buildAppBar(BuildContext context ,{required String title}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyles.bold19,
      ),
      centerTitle: true,
      actions: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: NotificationWidget(),
        )
      ],
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
    );
  }