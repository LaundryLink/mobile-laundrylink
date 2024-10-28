import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';
import 'package:laundry_link/app/data/models/outlet_model.dart';
import 'package:laundry_link/app/modules/home/controllers/home_controller.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';

import 'custom_appbar_outlet.dart';
import 'custom_card_service.dart';
import 'custom_coupon_widget.dart';
import 'custom_title_outlet.dart';

class OutletDetailView extends GetView<OutletController> {
  final Outlet outlet;
  const OutletDetailView({Key? key, required this.outlet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put<HomeController>(HomeController());
    final UnderConstructionController constructionController =
        Get.put<UnderConstructionController>(UnderConstructionController());
    return Scaffold(
      backgroundColor: Colors.white,
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
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/outlet_image.png',
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
                    CustomAppBarOutlet(
                        constructionController: constructionController)
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.002,
                ),
                TitleDetailOutlet(
                    outlet: outlet,
                    constructionController: constructionController),
                Container(
                  width: Get.width,
                  height: Get.height * 0.08,
                  child: GridView.builder(
                      padding: EdgeInsets.only(left: Get.width * 0.04),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        childAspectRatio: Get.width * 0.0010,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CustomCouponWidget(
                          constructionController: constructionController,
                        );
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.04, right: Get.width * 0.04),
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pilih paket untuk cucianmu",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return SizedBox(
                              height: Get.height * 0.5,
                              width: Get.width,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.only(bottom: Get.width * 0.04),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: Get.height * 0.017),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      controller.serviceOutletData.length,
                                  itemBuilder: (context, index) {
                                    final serviceData =
                                        controller.serviceOutletData[index];
                                    final iconService =
                                        controller.iconServiceList[index];
                                    return CustomCardService(
                                        outlet: outlet,
                                        outletController: controller,
                                        constructionController:
                                            constructionController,
                                        serviceOutletData: serviceData,
                                        pathIcon: iconService);
                                  }),
                            );
                          }
                        })
                      ],
                    ))
              ],
            ),
          );
        }
      }),
    );
  }
}
