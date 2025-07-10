import 'package:flutter/material.dart';
import 'package:fruitshub/core/helpers/on_generate_routes.dart';
import 'package:fruitshub/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
      home: const SplashView(),
    );
  }
}
