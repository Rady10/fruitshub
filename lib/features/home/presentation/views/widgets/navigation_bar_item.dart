import 'package:flutter/material.dart';
import 'package:fruitshub/features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruitshub/features/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;

  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavBarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500), // slower
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: isSelected
          ? ActiveItem(
              key: const ValueKey('active'),
              text: bottomNavBarEntity.name,
              image: bottomNavBarEntity.activeImage,
            )
          : InActiveItem(
              key: const ValueKey('inactive'),
              image: bottomNavBarEntity.inActiveImage,
            ),
    );
  }
}
