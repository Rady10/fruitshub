import 'package:flutter/material.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: HomeViewBody()
      ),
    );
  }
}