import 'package:flutter/material.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/search_text_field.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16,),
                CustomHomeAppBar(),
                SizedBox(height: 16,),
                SearchTextField()
              ],
            ),
          )
        ],
      ),
    );
  }
}