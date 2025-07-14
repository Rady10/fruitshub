import 'package:flutter/material.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/core/widgets/custom_text_field.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/auth_toggle_widget.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24,),
            const CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16,),
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
            const TermsAndConditions(),
            const SizedBox(height: 30,),
            CustomButton(
              onPressed: (){}, 
              text: 'إنشاء حساب جديد'
            ),
            const SizedBox(height: 26,),
            AuthToggleTextWidget(
              firstText: 'تمتلك حساب بالفعل؟', 
              secondText: '  تسجيل دخول', 
              onPressed: (){
                Navigator.of(context).pop();
              }
            )
          ],
        ),
      ),
    );
  }
}