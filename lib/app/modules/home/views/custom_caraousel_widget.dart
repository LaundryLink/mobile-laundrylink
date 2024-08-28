import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

import '../../../data/utils/resources/app_theme.dart';
import '../controllers/home_controller.dart';

class CustomCaraouselWidget extends StatelessWidget {
  const CustomCaraouselWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FlutterCarousel(
          items: controller.imageList
              .map((imagePath) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      height: Get.height * 0.17,
                      width: Get.width * 0.9,
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            showIndicator: false,
            floatingIndicator: true,
            height: Get.height * 0.17,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1.1,
            onPageChanged: (index, reason) {
              controller.updateIndex(index);
            },
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                controller.imageList.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: controller.currentIndex == entry.key
                    ? Get.width * 0.060
                    : Get.width * 0.020,
                height: Get.height * 0.010,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  color: controller.currentIndex == entry.key
                      ? Resources.color.thirdPrimaryColor
                      : Colors.grey,
                ),
              );
            }).toList(),
          );
        }),
      )
    ]);
  }
}