import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/helpers/build_snack_bar.dart';
import 'package:fruitshub/core/widgets/custom_progress_hud.dart';
import 'package:fruitshub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/signup_view_body.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure){
          buildSnackBar(context, state.message);
        }
        if (state is SignupSuccess){
          buildSnackBar(context, 'تم إنشاء الحساب بنجاح, قم بتسجيل الدخول');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false, 
          child: const SignupViewBody()
        );
      },
    );
  }

}
