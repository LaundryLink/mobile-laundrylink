import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/models/outlet_model.dart';
import '../../../data/models/services_model.dart';
import '../../../data/utils/resources/app_theme.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/payment_controller.dart';

class PaymentPickUpView extends GetView<PaymentController> {
  final Outlet outlet;
  final Service service;
  final RxList<int> quantities;

  PaymentPickUpView(
      {super.key,
      required this.profileController,
      required this.outlet,
      required this.service,
      required this.quantities});

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    UnderConstructionController _underConstructionController =
        Get.put(UnderConstructionController());
    print(service);
    print(outlet);
    print(quantities);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alamat Penjemputan",
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          GestureDetector(
            onTap: () => _underConstructionController.message(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Resources.color.secondaryColor,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileController.user.fullName,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        Text(
                          "Alamat",
                          style: TextStyle(
                              color: Color(0xff595959),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                )),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: Color(0xff808080),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.014,
          ),
          Text(
            "Waktu Penjemputan",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          TabBarCard(
            controller: controller,
            tabText1: "Dijemput sekarang",
            tabText2: "Jadwalkan penjemputan",
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SchedulePickedUpState(
              outlet: outlet,
              service: service,
              quantities: quantities,
              controller: controller,
              underConstructionController: _underConstructionController),
          SizedBox(
            height: Get.height * 0.01,
          ),
        ],
      ),
    );
  }
}

class SchedulePickedUpState extends StatelessWidget {
  const SchedulePickedUpState(
      {super.key,
      required this.controller,
      required UnderConstructionController underConstructionController,
      required this.outlet,
      required this.service,
      required this.quantities})
      : _underConstructionController = underConstructionController;

  final PaymentController controller;
  final UnderConstructionController _underConstructionController;
  final Outlet outlet;
  final Service service;
  final RxList<int> quantities;

  @override
  Widget build(BuildContext context) {
    final estimateLaundryPrice = controller.calculateLaundryPrice(
        controller.calculateTotalQuantities(quantities),
        service.priceItem,
        controller.calculateWeightInKg(quantities));

    return Obx(
      () => IndexedStack(
          index: controller.selectedIndexPickedUp.value,
          children: [
            PickedUpNowView(underConstructionController: _underConstructionController, service: service, quantities: quantities, controller: controller, estimateLaundryPrice: estimateLaundryPrice),
            Text("data")
          ]),
    );
  }
}

class PickedUpNowView extends StatelessWidget {
  const PickedUpNowView({
    super.key,
    required UnderConstructionController underConstructionController,
    required this.service,
    required this.quantities,
    required this.controller,
    required this.estimateLaundryPrice,
  }) : _underConstructionController = underConstructionController;

  final UnderConstructionController _underConstructionController;
  final Service service;
  final RxList<int> quantities;
  final PaymentController controller;
  final double estimateLaundryPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                left: Get.width * 0.03,
                right: Get.width * 0.03,
                top: Get.height * 0.01,
                bottom: Get.height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pakaianmu",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _underConstructionController.message(),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              color: Resources.color.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      )
                    ]),
                Divider(),
                Text(
                  service.title,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Column(
                    children: List.generate(quantities.length, (index) {
                  final itemsAllowed = service.itemsAllowed[index];
                  return SizedBox(
                    width: Get.width,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          itemsAllowed.itemName,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text("x ${quantities[index]}"),
                      ],
                    ),
                  );
                })),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Divider(),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text("Total Pakaian"),
                      Text(
                          "${controller.calculateTotalQuantities(quantities).toString()} pcs")
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text("Estimasi Total Berat Pakaian"),
                      Text(
                          "${controller.calculateWeightInKg(quantities).toStringAsFixed(1)} kg")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Text(
          "Catatam Untuk Laundry",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
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
        SizedBox(
          height: Get.height * 0.02,
        ),
        Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                left: Get.width * 0.03,
                right: Get.width * 0.03,
                top: Get.height * 0.01,
                bottom: Get.height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rincian Pembayaran",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Divider(),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text("Estimasi Total Cucian"),
                      Text(Resources.currencyFormat.currency.formatString(estimateLaundryPrice.toString()) )
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [Text("Biaya Ongkir"), Text("Rp.0")],
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text("Biaya Layanan"),
                      Text(
                          "${Resources.currencyFormat.currency.formatDouble(controller.adminPrice.toDouble())}")
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Pembayaran",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                          "${Resources.currencyFormat.currency.formatString((estimateLaundryPrice + controller.adminPrice).toString())}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TabBarCard extends StatelessWidget {
  const TabBarCard({
    super.key,
    required this.controller,
    required this.tabText1,
    required this.tabText2,
  });

  final PaymentController controller;
  final String tabText1;
  final String tabText2;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          color: Colors.white,
          shape: Border(),
          child: Row(
            children: [
              CustomTabView(
                index: 0,
                colorSelected: controller.changeTabColorPickedUp1(),
                controller: controller,
                text: tabText1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              CustomTabView(
                index: 1,
                controller: controller,
                text: tabText2,
                colorSelected: controller.changeTabColorPickedUp2(),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomTabView extends StatelessWidget {
  final PaymentController controller;
  final Color colorSelected;
  final String text;
  final int index;
  final BorderRadius borderRadius;

  const CustomTabView({
    Key? key,
    required this.controller,
    required this.text,
    required this.colorSelected,
    required this.index,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTabIndexPickedUp(index),
        child: Obx(() => Container(
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(),
                color: controller.selectedIndexPickedUp.value == index
                    ? Color(0xB32A9DDD)
                    : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: Get.width * 0.02),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorSelected,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
