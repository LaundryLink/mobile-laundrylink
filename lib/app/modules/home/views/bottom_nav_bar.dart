import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/home/controllers/home_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends GetView<HomeController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => PersistentTabView(
          context,
          controller: controller.tabController,
          screens: controller.buildScreens(),
          items: controller.navBarsItems(),
          backgroundColor: Colors.white,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          animationSettings: NavBarAnimationSettings(
              navBarItemAnimation: ItemAnimationSettings(
                  duration: Duration(milliseconds: 200), curve: Curves.ease),
              screenTransitionAnimation: ScreenTransitionAnimationSettings(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              )),
          
          navBarStyle: NavBarStyle.style3,
          onItemSelected: (index) {
            controller.changePage(index);
          },
        ));
  }
}
