import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/onboarding/onboarding_controller.dart';
import 'package:myrecipe_app/onboarding/onboarding_navigation.dart';
import 'package:myrecipe_app/onboarding/onboarding_nextbutton.dart';
import 'package:myrecipe_app/onboarding/onboarding_page.dart';
import 'package:myrecipe_app/onboarding/onboarding_skip.dart';
import 'package:myrecipe_app/utils/constants/image_strings.dart';
import 'package:myrecipe_app/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      // backgroundColor: Colors.orange.shade600,

      body: Stack(
        children: [
          Positioned(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.orange,
                  Color.fromARGB(255, 255, 142, 142),
                  // Colors.orange
                ])),
          )),
          SafeArea(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              // horizontal scrollable pages

              children: const [
                OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3,
                ),
              ],
            ),
          ),

          //skip button

          const OnBoardingSkip(),

          //dot navigation smooth page indicator

          const OnBoardingDotNavigation(),

          //circular button

          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
