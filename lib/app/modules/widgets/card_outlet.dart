import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/outlet_model.dart';
import 'custom_icons.dart';

class CardOutlet extends StatelessWidget {
  const CardOutlet({
    super.key,
    required this.outlet,
  });

  final Datum outlet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ()=>print("klik " + outlet.id.toString()),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 25, bottom: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.asset(
                'assets/images/outlet_image.png',
                width: Get.width * 0.45,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment:
                          WrapCrossAlignment.center,
                      spacing: 3,
                      direction: Axis.horizontal,
                      children: [
                        CustomIcon(
                          pathIcon: 'assets/svg/star_icon.svg',
                          width: 12,
                          height: 12,
                        ),
                        Text(
                          outlet.rating,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                  SizedBox(
                    height: Get.height * 0.008,
                  ),
                  Wrap(
                      direction: Axis.vertical,
                      spacing: 2,
                      children: [
                        Text(
                          outlet.name,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'Rp.${outlet.estimateIncome}.000 / kg',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        )
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}