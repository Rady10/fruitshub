import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/core/widgets/custom_button.dart';
import 'package:fruitshub/core/widgets/custom_text_field.dart';
import 'package:fruitshub/core/widgets/password_field.dart';
import 'package:fruitshub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/auth_toggle_widget.dart';
import 'package:fruitshub/features/auth/presentation/view/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, userName, password;
  late bool isTremsAccepted = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24,),
              CustomTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
                onSaved: (value){
                  userName = value!;
                },
              ),
              const SizedBox(height: 16,),
              CustomTextFormField(
                hintText: 'البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
                onSaved: (value){
                  email = value!;
                },
              ),
              const SizedBox(height: 16,),
              PasswordField(
                onSaved: (value){
                  password = value!;
                },
              ),
              const SizedBox(height: 16,),
              TermsAndConditions(
                onChecked: (value) {
                  isTremsAccepted = value;
                },
              ),
              const SizedBox(height: 30,),
              CustomButton(
                onPressed: (){
                  if (formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    if (isTremsAccepted) {
                      context.read<SignupCubit>().createUserWithEmailAndPassword(email, password, userName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يجب قبول الشروط والأحكام'))
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }, 
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
      ),
    );
  }
}
