import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/services_model.dart';
import 'border_icon_service.dart';

class CustomTitleService extends StatelessWidget {
  const CustomTitleService({
    super.key,
    required this.borderRadius,
    required this.pathIcon,
    required this.iconWidth,
    required this.serviceOutletData,
  });

  final double borderRadius;
  final String pathIcon;
  final double iconWidth;
  final Service serviceOutletData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.099,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BorderIconService(
              borderRadius: borderRadius,
              pathIcon: pathIcon,
              iconWidth: iconWidth),
          SizedBox(
            width: Get.width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.01, bottom: Get.height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      serviceOutletData.title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Jenis item yang dipilih hanya ${serviceOutletData.description}",
                      style: TextStyle(
                          fontWeight:
                              FontWeight.w400,
                          fontSize: 10),
                    )
                  ],
                ),
                Text(
                    "Rp.${serviceOutletData.priceItem}/${serviceOutletData.serviceItemFormat}")
              ],
            ),
          )
        ],
      ),
    );
  }
}