// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fruitshub/core/services/shared_preferences_singleton.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/features/auth/presentation/view/login_view.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    executeNaigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft  ,
          child: SvgPicture.asset(Assets.imagesPlant)
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill,),
      ],
    );
  }

  void executeNaigation(){
    bool isOnBoardingViewSeen = Prefs.getBool(isOnBoardingView);
    Future.delayed(
      const Duration(seconds: 3),
      (){
        if(isOnBoardingViewSeen){
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      }
    );
  }

}

