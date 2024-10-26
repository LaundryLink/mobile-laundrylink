import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';

import '../../../data/utils/resources/app_theme.dart';

class CustomCouponWidget extends StatelessWidget {
  const CustomCouponWidget(
      {super.key, required UnderConstructionController constructionController})
      : _constructionController = constructionController;
  final UnderConstructionController _constructionController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShapeDiscount(),
          SizedBox(
            width: Get.width * 0.01,
          ),
          ShapeKlaim(
            constructionController: _constructionController,
          ),
        ],
      ),
    );
  }
}

class ShapeKlaim extends StatelessWidget {
  const ShapeKlaim(
      {super.key, required UnderConstructionController constructionController})
      : _constructionController = constructionController;
  final UnderConstructionController _constructionController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.15,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0x4D2196EE), width: 1.0),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(7), bottomRight: Radius.circular(7))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.015,
          ),
          GestureDetector(
            onTap: () {
              _constructionController.message();
            },
            child: Container(
              alignment: Alignment.center,
              width: Get.width * 0.1,
              height: Get.height * 0.03,
              decoration: BoxDecoration(
                  color: Resources.color.secondaryColor,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "klaim",
                style: TextStyle(
                    fontSize: 12, color: Resources.color.textButtonSecondary),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.006),
          Container(
            width: Get.width,
            padding: EdgeInsets.only(right: Get.width * 0.02),
            child: Text(
              "S&K",
              style: TextStyle(fontSize: 11, color: Color(0xFF00C2FF)),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}

class ShapeDiscount extends StatelessWidget {
  const ShapeDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.23,
      padding: EdgeInsets.only(left: Get.width * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0x4D2196EE), width: 1.0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7), bottomLeft: Radius.circular(7))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diskon 50%",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Resources.color.textButtonPrimary),
          ),
          Text(
            "s/d Rp.10RB",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF949494)),
          ),
        ],
      ),
    );
  }
}
