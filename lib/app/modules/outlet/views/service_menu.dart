import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';

import '../../../data/models/services_model.dart';

class ServicesMenu extends StatelessWidget {
  const ServicesMenu({
    super.key,
    required this.serviceOutletData,
    required this.outletController,
  });

  final OutletController outletController;
  final Service serviceOutletData;

  @override
  Widget build(BuildContext context) {
    outletController.initializeQuantities(serviceOutletData.itemsAllowed.length);
    return SizedBox(
        width: Get.width,
        height: Get.height * 0.18,
        child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: Get.height * 0.017),
            padding: EdgeInsets.zero,
            itemCount: serviceOutletData.itemsAllowed.length,
            itemBuilder: (context, index) {
              final itemAllowed = serviceOutletData.itemsAllowed[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: Get.width,
                      height: Get.height * 0.04,
                      padding: EdgeInsets.only(
                          left: Get.width * 0.04, right: Get.width * 0.04),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itemAllowed.itemName),
                          InputQty.int(
                            initVal: 0,
                            minVal: 0,
                            maxVal: itemAllowed.maxQuantity,
                            decoration: QtyDecorationProps(
                                isBordered: false,
                                qtyStyle: QtyStyle.classic,
                                btnColor: Color(0xff3E4958)),
                          onQtyChanged: (val){
                            outletController.updateQuantity(index, val);
                          },)
                        ],
                      )),
                ],
              );
            }));
  }
}
