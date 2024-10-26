import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils/resources/app_theme.dart';
import '../../widgets/custom_icons.dart';

class BorderIconService extends StatelessWidget {
  const BorderIconService({
    super.key,
    required this.borderRadius,
    required this.pathIcon,
    required this.iconWidth,
  });

  final double borderRadius;
  final String pathIcon;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Resources.color.secondaryColor),
        child: CustomIcon(
          pathIcon: pathIcon,
          width: Get.width * iconWidth,
        ));
  }
}