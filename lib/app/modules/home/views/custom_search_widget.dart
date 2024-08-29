import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/under_construction_controller.dart';
import '../controllers/home_controller.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required UnderConstructionController constructionController,
    required this.controller,
  }) : _constructionController = constructionController;

  final UnderConstructionController _constructionController;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.047,
      color: Colors.transparent,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 12.0),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.56),
              gapPadding: 0.0,
              borderSide: BorderSide.none),
          hintText: "Mau cuci apa hari ini?",
          hintStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400),
          prefixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // _constructionController.message();
              controller.searchOutlets(
                  controller.outletsList.first.name);
            },
          ),
        ),
        onSubmitted: (value) {
          controller.searchOutlets(value);
        },
      ),
    );
  }
}