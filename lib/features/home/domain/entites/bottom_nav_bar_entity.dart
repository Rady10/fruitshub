// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fruitshub/core/utils/assets.dart';

class BottomNavBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavBarEntity> get bottomNavigationBarItems => [
      BottomNavBarEntity(
          activeImage: Assets.imagesVuesaxBoldHome,
          inActiveImage: Assets.imagesVuesaxOutlineHome,
          name: 'الرئيسية'),
      BottomNavBarEntity(
          activeImage: Assets.imagesVuesaxBoldProducts,
          inActiveImage: Assets.imagesVuesaxOutlineProducts,
          name: 'المنتجات'),
      BottomNavBarEntity(
          activeImage: Assets.imagesVuesaxBoldShoppingCart,
          inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
          name: 'سلة التسوق'),
      BottomNavBarEntity(
          activeImage: Assets.imagesVuesaxBoldUser,
          inActiveImage: Assets.imagesVuesaxOutlineUser,
          name: 'حسابي'),
    ];
