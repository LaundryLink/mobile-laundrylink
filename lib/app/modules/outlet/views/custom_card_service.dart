import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/data/models/services_model.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/utils/resources/app_theme.dart';
import 'border_icon_service.dart';
import 'custom_title_service.dart';
import 'service_menu.dart';

class CustomCardService extends StatelessWidget {
  const CustomCardService({
    super.key,
    required this.constructionController,
    required this.serviceOutletData,
    required this.pathIcon,
    required this.outletController,
    this.borderRadius = 10,
    this.iconWidth = 0.18,
  });

  final UnderConstructionController constructionController;
  final Service serviceOutletData;
  final OutletController outletController;

  final String pathIcon;
  final double borderRadius;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              BorderIconService(
                  borderRadius: borderRadius,
                  pathIcon: pathIcon,
                  iconWidth: iconWidth),
              SizedBox(
                width: Get.width * 0.04,
              ),
              SizedBox(
                height: Get.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(direction: Axis.vertical, children: [
                      Text(
                        serviceOutletData.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        serviceOutletData.description,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF808080)),
                      )
                    ]),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                        "${Resources.currencyFormat.currency.formatDouble(serviceOutletData.priceItem.toDouble()) }/${serviceOutletData.serviceItemFormat}")
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
                color: Colors.white,
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor:
                      WidgetStatePropertyAll(Resources.color.secondaryColor),
                ),
                onPressed: () {
                  outletController.totalPrice = 0.obs;
                  showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => DraggableScrollableSheet(
                            expand: false,
                            builder: (context, scrollController) => Container(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.04,
                                  right: Get.width * 0.04,
                                  top: Get.height * 0.03),
                              height: Get.height * 0.03,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTitleService(
                                        borderRadius: borderRadius,
                                        pathIcon: pathIcon,
                                        iconWidth: iconWidth,
                                        serviceOutletData: serviceOutletData),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      "Item yang ingin di masukkan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    ServicesMenu(
                                        outletController: outletController,
                                        serviceOutletData: serviceOutletData),
                                    Text("Catatan Untuk Laundry",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14)),
                                    TextField(
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          hintText: "Yang bersih ya kak",
                                          hintStyle: TextStyle(
                                              color: Color(0xff808080),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10),
                                          border: OutlineInputBorder()),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(Resources
                                                        .color.secondaryColor),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                fixedSize:
                                                    WidgetStatePropertyAll(Size(
                                                        Get.width * 0.65,
                                                        Get.height * 0.01))),
                                            onPressed: () {
                                              constructionController.message();
                                            },
                                            child: Text('Simpan', style: TextStyle(color: Resources.color.textButtonSecondary),)),
                                        Obx(
                                          () {
                                            return Container(
                                              width: Get.width * 0.23,
                                              height: Get.height * 0.05,alignment: Alignment.center,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                  color: Resources
                                                      .color.secondaryColor),
                                              child: Text(textAlign: TextAlign.center,
                                                  "Rp.${outletController.totalPrice}",style: TextStyle(color: Resources.color.textButtonSecondary),),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                icon: Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}
