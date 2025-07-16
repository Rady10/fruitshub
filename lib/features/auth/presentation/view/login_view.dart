import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/services/get_it_service.dart';
import 'package:fruitshub/core/widgets/custom_app_bar.dart';
import 'package:fruitshub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruitshub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/login_view_bloc_consumer.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar('تسجيل دخول', context),
        body: const LoginViewBlocConsumer(),
      ),
    );
  }
}

