import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/helpers/build_snack_bar.dart';
import 'package:fruitshub/core/widgets/custom_progress_hud.dart';
import 'package:fruitshub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:fruitshub/features/home/presentation/views/home_view.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure){
          buildSnackBar(context, state.message);
        }
        if (state is LoginSuccess){
          Navigator.pushNamed(context, HomeView.routeName);
          buildSnackBar(context, 'تم تسجيل الدخول بنجاح');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LoginLoading ? true : false,
          child: const LoginViewBody()
        );
      },
    );
  }
}
