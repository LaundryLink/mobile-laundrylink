import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

import '../controllers/home_controller.dart';
import 'custom_app_bar_widget.dart';
import 'custom_caraousel_widget.dart';
import 'custom_location_widget.dart';
import 'custom_search_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UnderConstructionController _constructionController =
        Get.put(UnderConstructionController());
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/svg/dashboard_wave.svg',
              fit: BoxFit.cover,
              width: Get.width,
              height: Get.height * 0.26,
            )),
        Positioned(
            top: AppBar.preferredHeightFor(
                context, Size(Get.width, Get.height / 12)),
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomAppBar(controller: controller,
                            constructionController: _constructionController),
                        SizedBox(height: Get.height * 0.015),
                        CustomLocationWidget(
                            constructionController: _constructionController),
                        SizedBox(height: Get.height * 0.01),
                        CustomSearchWidget(
                            constructionController: _constructionController,
                            controller: controller),
                        SizedBox(height: Get.height * 0.02),
                        CustomCaraouselWidget(controller: controller),
                        SizedBox(height: Get.height * 0.04),
                        SizedBox(
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
                                        fontWeight: FontWeight.w600, color: Resources.color.thirdPrimaryColor),
                                  ),
                                )
                              ]),
                        )

                        // Column(
                        //   children: [
                        //     Obx(() {
                        //       if (controller.isLoading.value) {
                        //         return Center(child: CircularProgressIndicator());
                        //       } else if (controller.outletsList.isEmpty) {
                        //         return Center(child: Text("No data available"));
                        //       } else {
                        //         return ListView.builder(
                        //           itemCount: controller.outletsList.length,
                        //           itemBuilder: (context, index) {
                        //             final outlet = controller.outletsList[index];
                        //             return ListTile(
                        //               title: Text(outlet.name),
                        //               subtitle: Text(outlet.address),
                        //               trailing: Text("Rating: ${outlet.rating}"),
                        //             );
                        //           },
                        //         );
                        //       }
                        //     }),
                        //   ],
                        // ),
                      ]),
                ),
              ),
            ))
      ],
    ));
  }
}
