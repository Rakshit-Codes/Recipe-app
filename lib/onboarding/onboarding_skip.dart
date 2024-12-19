import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myrecipe_app/authentication/login.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {Get.to(LoginScreen());},
        child: const Text('skip',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.w500),),
      ),
    );
  }
}