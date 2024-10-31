import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/outlet_model.dart';
import '../../../data/models/services_model.dart';
import '../../../data/utils/resources/app_theme.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../widgets/custom_icons.dart';
import '../controllers/payment_controller.dart';
import 'payment_pick_up_view.dart';
import 'payment_self_delivered_view.dart';

class CustomTabPayment extends GetView<PaymentController> {
  final Outlet outlet = Get.arguments['outlet'];
  final Service service = Get.arguments['service'];
  final RxList<int> quantities = Get.arguments['quantities'];
  CustomTabPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController _profileController = Get.put(ProfileController());
    final estimateLaundryPrice = controller.calculateLaundryPrice(
        controller.calculateTotalQuantities(quantities),
        service.priceItem,
        controller.calculateWeightInKg(quantities));
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: Get.height * 0.12,
        padding: EdgeInsets.only(
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            top: Get.height * 0.01),
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Total Pembayaran",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                "${Resources.currencyFormat.currency.formatDouble((estimateLaundryPrice + controller.adminPrice))}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              )
            ]),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Pesan",
                style: TextStyle(
                    color: Resources.color.textButtonSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  minimumSize: WidgetStatePropertyAll(
                      Size(Get.width, Get.height * 0.06)),
                  backgroundColor:
                      WidgetStatePropertyAll(Resources.color.secondaryColor)),
            )
          ],
        ),
      ),
      backgroundColor: Resources.color.textButtonSecondary,
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text(
          outlet.name,
          style: TextStyle(
            color: Resources.color.textButtonSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Resources.color.textButtonSecondary,
            size: 24,
          ),
        ),
        backgroundColor: Resources.color.secondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.06,
          right: Get.width * 0.06,
          top: Get.height * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarCard(controller: controller),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Divider(),
            Expanded(
              child: Obx(() => IndexedStack(
                    index: controller.selectedIndex.value,
                    children: [
                      PaymentPickUpView(
                        profileController: _profileController,
                        outlet: outlet,
                        service: service,
                        quantities: quantities,
                      ),
                      PaymentSelfDeliveredView(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarCard extends StatelessWidget {
  const TabBarCard({
    super.key,
    required this.controller,
  });

  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          color: Colors.white,
          shape: Border(),
          child: Row(
            children: [
              CustomTabView(
                index: 0,
                colorSelected: controller.changeTabColor1(),
                controller: controller,
                pathIcon: "assets/svg/bike_icon.svg",
                text: "Dijemput",
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              CustomTabView(
                index: 1,
                controller: controller,
                pathIcon: "assets/svg/laundry_machine_icon.svg",
                text: "Antar Sendiri",
                colorSelected: controller.changeTabColor2(),
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
  final String pathIcon;
  final String text;
  final int index;
  final BorderRadius borderRadius;

  const CustomTabView({
    Key? key,
    required this.controller,
    required this.pathIcon,
    required this.text,
    required this.colorSelected,
    required this.index,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTabIndex(index),
        child: Obx(() => Container(
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(),
                color: controller.selectedIndex.value == index
                    ? Color(0xB32A9DDD)
                    : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(pathIcon: pathIcon, color: colorSelected),
                  SizedBox(width: Get.width * 0.02),
                  Text(
                    text,
                    style: TextStyle(
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
