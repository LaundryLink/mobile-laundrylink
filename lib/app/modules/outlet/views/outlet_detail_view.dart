import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';
import 'package:laundry_link/app/data/models/outlet_model.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/modules/home/controllers/home_controller.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';

import 'custom_appbar_outlet.dart';

class OutletDetailView extends GetView<OutletController> {
  final Datum outlet;
  const OutletDetailView({Key? key, required this.outlet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put<HomeController>(HomeController());
    final UnderConstructionController constructionController =
        Get.put<UnderConstructionController>(UnderConstructionController());
    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (outlet.isBlank == true) {
          return Center(
            child: Text("No data available"),
          );
        } else {
          return Column(
            children: [
              Container(
                  color: Colors.red,
                  width: Get.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/outlet_image.png',
                        fit: BoxFit.cover,
                        width: Get.width,
                      ),
                      CustomAppBarOutlet(
                          constructionController: constructionController)
                    ],
                  )),
              SizedBox(
                height: Get.height * 0.001,
              ),
              Container(
                color: Colors.red,
                width: Get.width,
                child: Wrap(alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${outlet.name}"),
                        Text("${outlet.address}")
                      ],
                    ),
                    Container(color: Resources.color.secondaryColor, child: Text("data"),),
                    Container(color: Resources.color.secondaryColor, child: Text("data"),)
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
