import 'package:flutter/material.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}