import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myrecipe_app/onboarding/onboarding_controller.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/device/device_utility.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape:const CircleBorder(side: BorderSide.none),backgroundColor:Color.fromARGB(255, 119, 8, 0)),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}