import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/home/controllers/home_controller.dart';

import '../../../data/utils/resources/app_theme.dart';
import '../../../controllers/under_construction_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../widgets/custom_icon_buttons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.controller,
    required this.profileController,
    required UnderConstructionController constructionController,
  }) : _constructionController = constructionController;

  final UnderConstructionController _constructionController;
  final HomeController controller;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          if (profileController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text(
              "Hai, " + profileController.user.fullName,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Resources.color.textButtonSecondary),
            );
          }
        }),
        Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            direction: Axis.horizontal,
            children: [
              CustomIconButtons(
                  onTap: () => _constructionController.message(),
                  pathIcon: 'assets/svg/notif_icon.svg',
                  width: 20,
                  height: 20),
              CustomIconButtons(
                  onTap: () => _constructionController.message(),
                  pathIcon: 'assets/svg/chat_bubble_icon.svg',
                  width: 20,
                  height: 20),
              CustomIconButtons(
                  onTap: () => _constructionController.message(),
                  pathIcon: 'assets/svg/fav_icon.svg',
                  width: 20,
                  height: 20)
            ])
      ],
    );
  }
}
