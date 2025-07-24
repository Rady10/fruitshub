import 'package:flutter/material.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/search_text_field.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView()
        ],
      ),
    );
  }
}