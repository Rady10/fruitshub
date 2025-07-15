import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/services/get_it_service.dart';
import 'package:fruitshub/core/widgets/custom_app_bar.dart';
import 'package:fruitshub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruitshub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>()
      ),
      child: Scaffold(
        appBar: customAppBar('حساب جديد', context),
        body: const SignupViewBody(),
      ),
    );
  }
}
