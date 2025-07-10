import 'package:flutter/material.dart';
import 'package:fruitshub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
    
  }
}