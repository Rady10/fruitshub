import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/widgets/custom_app_bar.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const  routeName = 'login'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('تسجيل دخول', context),
      body: const LoginViewBody(),
    );
  }
}