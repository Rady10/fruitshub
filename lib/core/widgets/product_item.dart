import 'package:flutter/material.dart';
import 'package:fruitshub/core/themes/pallete.dart';
import 'package:fruitshub/core/themes/text_styles.dart';
import 'package:fruitshub/core/utils/assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        )
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                AspectRatio(
                  aspectRatio: 214 / 140,
                  child: SizedBox(
                    child: Image.asset(Assets.imagesAppleTest)
                  ),
                ),
                const SizedBox(height: 12,),
                ListTile(
                  title: const Text(
                    'فراولة', 
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30جنيه ',
                          style: TextStyles.bold13.copyWith(
                            color: Pallete.secondaryColor
                          )
                        ),
                        TextSpan(
                          text: '/ ',
                          style: TextStyles.bold13.copyWith(
                            color: Pallete.lightSecondaryColor
                          )
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: Pallete.lightSecondaryColor
                          )
                        ),
                      ]
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: Pallete.primaryColor,
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              ],
            ) 
          ),
        ],
      ),
    );
  }
}