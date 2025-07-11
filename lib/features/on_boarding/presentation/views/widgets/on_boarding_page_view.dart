import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisiable: true,
          image: Assets.imagesPageViewItem1Image, 
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage, 
          subtitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.', 
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبًا بك في',
                style: TextStyles.bold23,
              ),
              Text(
                ' HUB',
                style: TextStyles.bold23.copyWith(
                  color: Pallete.secondaryColor
                ),
              ),
              Text(
                'Fruit',
                style: TextStyles.bold23.copyWith(
                  color: Pallete.primaryColor
                ),
              ),
            ],
          )
        ),
        const PageViewItem(
          isVisiable: false,
          image: Assets.imagesPageViewItem2Image, 
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage, 
          subtitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية', 
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyles.bold23
          ),
        ),
      ],
    );
  }
}