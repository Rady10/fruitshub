import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/core/widgets/custom_text_field.dart';
import 'package:fruitshub/core/widgets/password_field.dart';
import 'package:fruitshub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/signup_view.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/auth_toggle_widget.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/or_divider.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/social_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  late String email;
  late String password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24,),
              CustomTextFormField(
                onSaved: (value){
                  email = value!;
                },
                hintText: 'البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16,),
              PasswordField(
                onSaved: (value){
                  password = value!;
                },
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: Pallete.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33,),
              CustomButton(
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().logInUser(email: email, password: password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }, 
                text: 'تسجيل الدخول'
              ),
              const SizedBox(height: 33,),
              AuthToggleTextWidget(
                firstText: 'لا تمتلك حساب؟',
                secondText: '  قم بانشاء حساب',
                onPressed: (){
                  Navigator.of(context).pushNamed(SignupView.routeName);
                },
              ),
              const SizedBox(height: 33,),
              const OrDivider(),
              const SizedBox(height: 16,),
              SocialButton(
                onPressed: (){
                  context.read<LoginCubit>().logInWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                text: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(height: 16,),
              SocialButton(
                onPressed: (){
                },
                image: Assets.imagesApplIcon,
                text: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(height: 16,),
              SocialButton(
                onPressed: (){
                  context.read<LoginCubit>().logInWithFacebook();
                },
                image: Assets.imagesFacebookIcon,
                text: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

