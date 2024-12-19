import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:myrecipe_app/authentication/login.dart';


class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: clearAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SizedBox(
                      width: Get.width,height: 500,
                      child: Lottie.asset(
                          'assets/images/animations/Logout.json',
                          fit: BoxFit.contain),
                    ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(width: Get.width-80,
                      child: const Text(
                        "It's Good idea to logout for protect your data",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // After data is cleared, navigate to LoginScreen
          return const Scaffold();
        }
      },
    );
  }

  Future<void> clearAllData() async {
    FirebaseAuth.instance.signOut();
    final storage = GetStorage();
    await storage.erase();
    Fluttertoast.showToast(msg: "Logout Successfully");
    // Get.snackbar("Success", "Logout Successfully",
    //     colorText: Color.fromARGB(255, 0, 177, 115),
    //     backgroundColor: TColors.B_bg_Snackbar);
    await Future.delayed(const Duration(seconds: 3)); // Wait for 2 seconds
    Get.offAll(() => LoginScreen());
  }
}