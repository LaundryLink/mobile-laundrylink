import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/modules/profile/controllers/profile_controller.dart';

import '../../widgets/card_outlet.dart';
import '../controllers/home_controller.dart';
import 'custom_app_bar_widget.dart';
import 'custom_caraousel_widget.dart';
import 'custom_location_widget.dart';
import 'custom_search_widget.dart';
import 'membership_card.dart';
import 'money_balence.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UnderConstructionController _constructionController =
        Get.put(UnderConstructionController());
    ProfileController _profileController = Get.put(ProfileController());
    return Scaffold(appBar: AppBar(toolbarHeight: 0, backgroundColor: Resources.color.secondaryColor,),
        body: Stack(
      children: [
        Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/svg/dashboard_wave.svg',
              fit: BoxFit.cover,
              width: Get.width,
            )),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                width: Get.width,
                color: Colors.transparent,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomAppBar(
                          controller: controller,
                          profileController: _profileController,
                          constructionController: _constructionController),
                      SizedBox(height: Get.height * 0.015),
                      CustomLocationWidget(
                          constructionController: _constructionController),
                      SizedBox(height: Get.height * 0.01),
                      CustomSearchWidget(
                          constructionController: _constructionController,
                          controller: controller),
                      SizedBox(height: Get.height * 0.02),
                      Wrap(
                        spacing: 3,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          MoneyBalence(
                              profileController: _profileController,
                              constructionController:
                                  _constructionController),
                          MembershipCard(
                              profileController: _profileController)
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      CustomCaraouselWidget(controller: controller),
                      SizedBox(height: Get.height * 0.04),
                      Container(
                        color: Colors.transparent,
                        width: Get.width,
                        child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Text("Terdekat",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              GestureDetector(
                                onTap: () =>
                                    _constructionController.message(),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Resources.color.thirdPrimaryColor),
                                ),
                              )
                            ]),
                      ),
                    ]),
              ),
              //List of Outlet Terdekat
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.outletsList.isEmpty) {
                  return Center(
                    child: Text("No data available"),
                  );
                } else {
                  return Container(
                      color: Colors.transparent,
                      width: Get.width,
                      height: Get.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.outletsList.length,
                        itemBuilder: (context, index) {
                          final outlet = controller.outletsList[index];
                          return CardOutlet(outlet: outlet);
                        },
                      ));
                }
              }),
          
              SizedBox(height: Get.height * 0.01),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Text("Terlaris",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            GestureDetector(
                              onTap: () => _constructionController.message(),
                              child: Text(
                                "Lihat Semua",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Resources.color.thirdPrimaryColor),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.outletsList.isEmpty) {
                  return Center(
                    child: Text("No data available"),
                  );
                } else {
                  return Container(
                      color: Colors.transparent,
                      width: Get.width,
                      height: Get.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.outletsList.length,
                        itemBuilder: (context, index) {
                          final outlet = controller.outletsList[index];
                          return CardOutlet(outlet: outlet);
                        },
                      ));
                }
              }),
            ],
          ),
        ),
      ],
    ));
  }
}
