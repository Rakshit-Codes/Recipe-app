import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myrecipe_app/authentication/login.dart';
import 'package:myrecipe_app/dui.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  Future<bool> checkIfEmailExists(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      // If no error is thrown, the email exists
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Email does not exist
        return false;
      } else {
        // Handle other errors if needed
        throw e;
      }
    } catch (e) {
      // Handle any other errors
      throw e;
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void forgetPassword(BuildContext context, String email, RxBool isLoading) async {
    if (email.isEmpty) {
      DUI.customAlertBox(context, "Enter an email to reset password");
    } else {
      try {
        isLoading(true);
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Fluttertoast.showToast(
          msg: "Email Sent Successfully\nCheck your mailbox",
        );
        Get.to(() => LoginScreen());
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.code.toString());
      } finally {
        isLoading(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.turn_left,
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.Bbackbuttonappbar
                    : TColors.Lbackbuttonappbar,
              ),
              onPressed: () {
                Get.back();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: 400,
                      child: Lottie.asset(
                        'assets/animation/forget password animation.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Enter Your Email Here",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DUI.customTextField(
                      _emailController,
                      "Email Address",
                      Icons.mail,
                      false,
                      controller: _emailController,
                      hintText: 'email@gmail.com',
                      fontsize: 14,
                      hintColor: TColors.Lbackbuttonappbar.withOpacity(0.7),
                      iconData: null,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: DUI.customButton(
                        () {
                          forgetPassword(context, _emailController.text, isLoading);
                        },
                        onPressed: () {
                          checkIfEmailExists(_emailController.text);
                        },
                        text: "Forget Password",
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: const Color.fromARGB(255, 1, 113, 4),
                      size: 50,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}