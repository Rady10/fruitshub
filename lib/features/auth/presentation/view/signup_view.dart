import 'package:flutter/material.dart';
import 'package:fruitshub/core/widgets/custom_app_bar.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('حساب جديد', context),
      body: const SignupViewBody(),
    );
  }
}