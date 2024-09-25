import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/utils/resources/app_theme.dart';
import '../../widgets/custom_icons.dart';

class CustomAppBarOutlet extends StatelessWidget {
  const CustomAppBarOutlet({
    super.key,
    required this.constructionController,
  });

  final UnderConstructionController constructionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: kToolbarHeight, left: 20, right: 20),
      width: Get.width,
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Resources.color.secondaryColor,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: Color(0x80FFFFFF))),
          Wrap(children: [
            IconButton(
                onPressed: () {
                  constructionController.message();
                },
                icon: CustomIcon(
                    pathIcon: 'assets/svg/fav_icon.svg'),
                style: IconButton.styleFrom(
                    backgroundColor: Color(0x80FFFFFF))),
            IconButton(
                onPressed: () {
                  constructionController.message();
                },
                icon: CustomIcon(
                    pathIcon: 'assets/svg/forward_icon.svg'),
                style: IconButton.styleFrom(
                    backgroundColor: Color(0x80FFFFFF))),
          ]),
        ],
      ),
    );
  }
}
