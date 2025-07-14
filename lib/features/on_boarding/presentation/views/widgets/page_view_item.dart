import 'package:flutter/material.dart';
import 'package:fruitshub/core/services/shared_preferences_singleton.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/features/auth/presentation/view/login_view.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.backgroundImage, required this.subtitle, required this.title, required this.isVisiable});

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisiable;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image)
              ),
              Visibility(
                visible: isVisiable,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: (){
                      Prefs.setBool(isOnBoardingView, true);
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                    },
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64,),
        title,
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            subtitle, 
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: Pallete.subtitleColor
            ),
          ),
        ),
      ],
    );
  }
}