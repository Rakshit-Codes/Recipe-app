import 'package:flutter/material.dart';
import 'package:myrecipe_app/onboarding/onboarding_controller.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/device/device_utility.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          dotColor: Color.fromARGB(255, 119, 8, 0),
          activeDotColor: dark ? TColors.light : TColors.light ,
          dotHeight: 5,
        ),
      ),
    );
  }
}