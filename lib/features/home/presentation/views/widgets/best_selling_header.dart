import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/features/best_selling/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          const Text(
            'الأكثر مبيعا',
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, BestSellingView.routeName);
            },
            child: Text(
              'المزيد',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xff949D9E)
              ),
            ),
          )
        ],
      ),
    );
  }
}