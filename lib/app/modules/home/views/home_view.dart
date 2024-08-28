import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:laundry_link/app/controllers/under_construction_controller.dart';

import '../controllers/home_controller.dart';
import 'custom_app_bar_widget.dart';
import 'custom_caraousel_widget.dart';

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
            child: SvgPicture.asset('assets/svg/dashboard_wave.svg',
                fit: BoxFit.cover, width: Get.width)),
        Positioned(
            top: AppBar.preferredHeightFor(
                context, Size(Get.width, Get.height / 12)),
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                  CustomAppBar(constructionController: _constructionController),
                  SizedBox(height: Get.height * 0.02),
                  Container(
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
                        hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            controller.searchOutlets(
                                controller.outletsList.first.name);
                          },
                        ),
                      ),
                      onSubmitted: (value) {
                        controller.searchOutlets(value);
                      },
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CustomCaraouselWidget(controller: controller),
                  SizedBox(height: Get.height * 0.04),
                  Text("Layanan",textAlign: TextAlign.left,)

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
            ))
      ],
    ));
  }
}


