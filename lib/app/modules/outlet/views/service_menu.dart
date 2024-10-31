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
    outletController
        .initializeQuantities(serviceOutletData.itemsAllowed.length);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(serviceOutletData.itemsAllowed.length, (index) {
        final itemAllowed = serviceOutletData.itemsAllowed[index];
        return Container(
            margin: EdgeInsets.only(bottom: Get.height * 0.015),
            width: Get.width,
            height: Get.height * 0.04,
            padding: EdgeInsets.only(
                left: Get.width * 0.04, right: Get.width * 0.04),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
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
                  onQtyChanged: (val) {
                    outletController.updateQuantity(index, val);
                  },
                )
              ],
            ));
      }),
    );
  }
}
