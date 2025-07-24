import 'package:flutter/material.dart';
import 'package:fruitshub/core/widgets/build_app_bar.dart';
import 'package:fruitshub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الأكثر مبيعا'
      ),
      body: const BestSellingViewBody(),
    );
  }
}