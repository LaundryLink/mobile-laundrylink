import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/utils/resources/app_theme.dart';

class CustomActiveButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  CustomActiveButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.9,
        height: Get.height %
            56, // Use a fixed height instead of `Get.height % 56` for consistency
        decoration: BoxDecoration(
          color: Resources.color.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Resources.color.textButtonSecondary, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
