import 'package:flutter/material.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    executeNaigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft  ,
          child: SvgPicture.asset(Assets.imagesPlant)
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill,),
      ],
    );
  }

  void executeNaigation(){
  Future.delayed(
    const Duration(seconds: 3),
    (){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  );
}

}

