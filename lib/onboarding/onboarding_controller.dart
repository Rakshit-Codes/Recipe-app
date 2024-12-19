import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/authentication/login.dart';



class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }else if(currentPage.value==2){Get.to(LoginScreen());}
  }

  void skipPage() {
    pageController
        .jumpToPage(2); // Adjust the index based on your last onboarding page
  }

  void dotNavigationClick(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void updatePageIndicator(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}