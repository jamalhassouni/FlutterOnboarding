import 'package:flutter/material.dart';
import 'package:flutter_onboarding/core/global/routes/routes.dart';
import 'package:flutter_onboarding/models/onboarding_info.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  nextAction() {
    if (isLastPage) {
      Get.offNamed(RouteNames.homePage);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  skipAction() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/order.png', 'Order Your Food',
        'Now you can order food ant time right from your mobile.', "top"),
    OnboardingInfo('assets/images/cook.png', 'Cooking Safe Food',
        'We are maintain safty and we keep clean while making food.', "bottom"),
    OnboardingInfo('assets/images/deliver.png', 'Quick Delivery',
        'Orders your favorite meals will be immediately deliver', "top"),
  ];
}
