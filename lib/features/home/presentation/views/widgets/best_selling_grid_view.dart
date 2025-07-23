import 'package:flutter/material.dart';
import 'package:fruitshub/core/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 210,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16
      ), 
      itemCount: 6,
      itemBuilder: (context, index) => const ProductItem()
    );
  }
}