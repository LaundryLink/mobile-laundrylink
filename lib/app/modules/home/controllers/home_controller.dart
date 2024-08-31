import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/home/views/home_view.dart';
import 'package:laundry_link/app/modules/widgets/custom_icons.dart';
import 'package:laundry_link/app/modules/widgets/under_construction_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../data/models/outlet_model.dart';
import '../../../data/services/outlet_services.dart';

class HomeController extends GetxController {
  final OutletsService _outletsService = OutletsService();
  final PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      HomeView(),
      UnderConstructionView(),
      UnderConstructionView(),
    ];
  }

  var outletsList = <Datum>[].obs;
  var outletsList2 = <Datum>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
  var imageList = <String>[
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOutlets();
    navBarsItems();
  }

  @override
  void onReady() {
    super.onReady();
    navBarsItems();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          child: CustomIcon(pathIcon: 'assets/svg/beranda_icon.svg'),
        ),
        icon: CustomIcon(pathIcon: 'assets/svg/beranda_icon.svg'),
        activeColorPrimary: Colors.blue,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          child: CustomIcon(pathIcon: 'assets/svg/cucianku_icon.svg'),
        ),
        icon: CustomIcon(pathIcon: 'assets/svg/cucianku_icon.svg'),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          child: CustomIcon(pathIcon: 'assets/svg/profil_icon.svg'),
        ),
        icon: CustomIcon(
          pathIcon: 'assets/svg/profil_icon.svg',
          height: 32,
          width: 32,
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      )
    ];
  }

  void fetchOutlets() async {
    try {
      isLoading(true);
      var outlets = await _outletsService.fetchOutlets();
      if (outlets.data.isNotEmpty) {
       return outletsList2.assignAll(outlets.data);
      }
    } finally {
      isLoading(false);
    }
  }

  void searchOutlets(String name) async {
    try {
      isLoading(true);
      var outlets = await _outletsService.searchOutlets(name);
      if (outlets.data.isNotEmpty) {
        for (int i = 0; i < outletsList.length; i++) {
          debugPrint(outletsList[i].name);
          debugPrint(outletsList[i].address);
          debugPrint(outletsList[i].id.toString());
        }
        return outletsList.assignAll(outlets.data);
      } else {
        outletsList.clear();
      }
    } finally {
      isLoading(false);
    }
  }
}
