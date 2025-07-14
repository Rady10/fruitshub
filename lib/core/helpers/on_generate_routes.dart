import 'package:flutter/material.dart';
import 'package:fruitshub/features/auth/presentation/view/login_view.dart';
import 'package:fruitshub/features/auth/presentation/view/signup_view.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruitshub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }
}