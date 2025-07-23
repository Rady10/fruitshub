import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});


  @override
  Widget build(BuildContext context) {

    var itemWidth = MediaQuery.of(context).size.width;

    return Container(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342/158,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: itemWidth * 0.4,
              child: Image.asset(
                Assets.imagesWatermelonTest,
                fit: BoxFit.fill,
              )
            ),
            Container(
              width: itemWidth * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: svg.Svg(Assets.imagesFeaturedItemBackground),
                  fit: BoxFit.fill
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35,),
                    Text(
                      'عروض الصيف',
                      style: TextStyles.regular13.copyWith(
                        color: Colors.white
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19.copyWith(
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 15,),
                    FeaturedItemButton(
                      onPressed: (){},
                    ),
                    const SizedBox(height: 29,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}