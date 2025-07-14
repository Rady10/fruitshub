import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/core/widgets/custom_text_field.dart';
import 'package:fruitshub/features/auth/presentation/view/signup_view.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/auth_toggle_widget.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/or_divider.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/social_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24,),
            const CustomTextFormField(
              hintText: 'البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16,),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              icon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
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
              onPressed: (){}, 
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
              onPressed: (){},
              image: Assets.imagesGoogleIcon,
              text: 'تسجيل بواسطة جوجل',
            ),
            const SizedBox(height: 16,),
            SocialButton(
              onPressed: (){},
              image: Assets.imagesApplIcon,
              text: 'تسجيل بواسطة أبل',
            ),
            const SizedBox(height: 16,),
            SocialButton(
              onPressed: (){},
              image: Assets.imagesFacebookIcon,
              text: 'تسجيل بواسطة فيسبوك',
            ),
          ],
        ),
      ),
    );
  }
}

