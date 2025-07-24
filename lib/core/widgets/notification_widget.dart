import 'package:flutter/material.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Color(0xFFEEF8ED)
      ),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}