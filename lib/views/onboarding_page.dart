import 'package:flutter/material.dart';
import 'package:flutter_onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_onboarding/views/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_onboarding/core/global/extensions/color_extension.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_controller.onboardingPages[index].titlePosition ==
                            "top") ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 45.0),
                            child: Text(
                              _controller.onboardingPages[index].title,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "fallingskysebd",
                                  color: "#041839".toColor()),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45.0),
                              child: Text(
                                _controller.onboardingPages[index].description,
                                style: TextStyle(
                                    fontFamily: "lilgrotesk",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: "#9FA4AD".toColor()),
                              )),
                          const SizedBox(height: 32),
                          Align(
                            child: Image.asset(
                              _controller.onboardingPages[index].imageEsset,
                            ),
                          ),
                        ] else if (_controller
                                .onboardingPages[index].titlePosition ==
                            "bottom") ...[
                          Align(
                            child: Image.asset(
                              _controller.onboardingPages[index].imageEsset,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 45.0),
                            child: Text(
                              _controller.onboardingPages[index].title,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "fallingskysebd",
                                  color: "#041839".toColor()),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45.0),
                              child: Text(
                                _controller.onboardingPages[index].description,
                                style: TextStyle(
                                    fontFamily: "lilgrotesk",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: "#9FA4AD".toColor()),
                              ))
                        ],
                      ]);
                }),
            Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: List.generate(
                      _controller.onboardingPages.length,
                      (index) => Obx(() {
                            return Container(
                                margin: const EdgeInsets.all(4),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                    color:
                                        _controller.selectedPageIndex.value ==
                                                index
                                            ? "#0B0E43".toColor()
                                            : "#C9CCD2".toColor(),
                                    shape: BoxShape.circle));
                          })),
                )),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: "#0B0E43".toColor(),
                  elevation: 0,
                  child: Obx(() {
                    return Text(
                      _controller.isLastPage ? "Start" : "Next",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "fallingskysebd",
                      ),
                    );
                  }),
                  onPressed: _controller.nextAction,
                )),
            Positioned(
                child: Obx(() => IconButton(
                      icon: !_controller.isFirstPage
                          ? Icon(Icons.arrow_back, color: "#9FA4AD".toColor())
                          : const SizedBox.shrink(),
                      onPressed: () => {_controller.skipAction()},
                    ))),
            Positioned(
                right: 20,
                top: 20,
                child: InkWell(
                  onTap: () => Get.to(() => const HomePage()),
                  child: Text("Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "fallingskysebd",
                          color: "#9FA4AD".toColor())),
                ))
          ],
        ),
      ),
    );
  }
}
