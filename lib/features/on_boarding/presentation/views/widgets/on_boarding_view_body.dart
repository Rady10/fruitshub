import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitshub/core/services/shared_preferences_singleton.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/features/auth/presentation/view/login_view.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener((){
      currentPage = pageController.page!.round();
      setState(() {
        
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          )
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: Pallete.primaryColor,
            color: currentPage == 1 
              ? Pallete.primaryColor
              : Pallete.primaryColor.withValues(alpha: 0.5) 
          ),
        ),
        const SizedBox(height: 29,),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: CustomButton(
              onPressed: (){
                Prefs.setBool(isOnBoardingView, true);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              }, 
              text: "ابدأ الان"
            ),
          ),
        ),
        const SizedBox(height: 34,)
      ],
    );
  }
}