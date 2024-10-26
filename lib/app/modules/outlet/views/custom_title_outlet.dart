import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/models/outlet_model.dart';
import '../../../data/utils/resources/app_theme.dart';
import '../../widgets/custom_icons.dart';

class TitleDetailOutlet extends StatelessWidget {
  const TitleDetailOutlet({
    super.key,
    required this.outlet,
    required this.constructionController,
  });

  final Datum outlet;
  final UnderConstructionController constructionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${outlet.name}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Container(
                  color: Colors.transparent,
                  width: Get.width * 0.36,
                  child: Text(
                    "${outlet.address}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0xff595959)),
                    softWrap: true,
                  )), 
              SizedBox(
                height: Get.height * 0.003,
              ),
              Container(
                  width: Get.width * 0.4,
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIcon(
                        pathIcon: "assets/svg/star_icon.svg",
                        width: 14,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "${outlet.rating}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12)),
                        TextSpan(
                            text:
                                "\t (${outlet.reviews}+ Penilaian) ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff808080)))
                      ])),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          SizedBox(
            width: Get.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.05,
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Resources.color.secondaryColor),
                  child: Text(
                    "data",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Resources.color.textButtonSecondary),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.05,
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Resources.color.secondaryColor),
                  child: Text(
                    "Chat",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Resources.color.textButtonSecondary),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomIcon(
                      pathIcon: "assets/svg/pricetag_icon.svg"),
                  Text(
                    "\t Dapatkan potongan harga",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 10),
                  )
                ],
              ),
              TextButton.icon(
                style: ButtonStyle(
                    overlayColor:
                        WidgetStatePropertyAll(Colors.white),
                    foregroundColor:
                        WidgetStatePropertyAll(Colors.black),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.white),
                    splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  constructionController.message();
                },
                label: Text(
                  "Lihat Semua",
                  style: TextStyle(fontSize: 12),
                ),
                iconAlignment: IconAlignment.end,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}