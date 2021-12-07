import 'package:flutter_onboarding/views/home_page.dart';
import 'package:flutter_onboarding/views/onboarding_page.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String onboardingPage = '/OnboardingPage';

  static const String homePage = '/HomePage';
}

List<GetPage> getPages() {
  return <GetPage>[
    GetPage(name: RouteNames.onboardingPage, page: () => OnboardingPage()),
    GetPage(name: RouteNames.homePage, page: () => const HomePage()),
  ];
}
