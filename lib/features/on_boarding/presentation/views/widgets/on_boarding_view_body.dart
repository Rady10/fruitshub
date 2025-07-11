import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: ColorPallete.primaryColor,
            color: ColorPallete.primaryColor.withValues(alpha: 0.5)
          ),
        ),
        const SizedBox(height: 29,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: CustomButton(onPressed: (){}, text: "ابدأ الان"),
        ),
        const SizedBox(height: 34,)
      ],
    );
  }
}