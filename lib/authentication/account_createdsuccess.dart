import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/main_home_screen.dart';
import 'package:myrecipe_app/navigation_menu.dart';


class AccountCreatedSuccessScreen extends StatefulWidget {
  const AccountCreatedSuccessScreen({super.key});

  @override
  AccountCreatedSuccessState createState() => AccountCreatedSuccessState();
}

class AccountCreatedSuccessState extends State<AccountCreatedSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  static const String keylogin = "login";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 3).animate(_controller);

    _controller.forward();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // Center(
              //   child: SizedBox(
              //   width:Get.width,height: 500,
              //     child: Lottie.asset(
              //         'assets/images/animations/account_created_success.json',
              //         fit: BoxFit.contain),
              //   ),
              // ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  " Now , You  Can  Start  Your  Product  Seling  Journey  On  Jalaram  Kirana  ",
                  style: Theme.of(context).textTheme.headlineSmall,
                               ),
               ),
           //   HomeScreen(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void whereToGo() async {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAll(() => NavigationScreen());
      },
    );
  }
}