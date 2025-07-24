import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/core/widgets/notification_widget.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(5.5),
        child: Image.asset(Assets.imagesProfileImage)
      ),
      title: Text(
        'صباح الخير !..', 
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(
          color: const Color(0xFF949D9E)
        ),
      ),
      subtitle: const Text(
        'احمد مصطفى', 
        textAlign: TextAlign.right,
        style: TextStyles.bold16
      ),
      trailing: const NotificationWidget(),
    );
  }
}

