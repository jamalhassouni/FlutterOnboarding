import 'package:flutter/material.dart';
import 'package:flutter_onboarding/views/onboarding_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.to(() => OnboardingPage()),
              child: const Text("Go to onboarding Screen"),
            ),
            TextButton(
              onPressed: () {
                Get.snackbar("Title", "This is getx snackbar",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text("show Snackbar"),
            )
          ],
        ),
      ),
    );
  }
}
