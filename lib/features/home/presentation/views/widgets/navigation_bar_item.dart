import 'package:flutter/material.dart';
import 'package:fruitshub/features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isSelected, required this.bottomNavBarEntity});

  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;


  @override
  Widget build(BuildContext context) {
    return isSelected 
    ? ActiveItem(
      text: bottomNavBarEntity.name,
      image: bottomNavBarEntity.activeImage,
    )
    : InActiveItem(image: bottomNavBarEntity.inActiveImage);
  }
}
