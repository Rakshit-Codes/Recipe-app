// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:myrecipe_app/authentication/verify_email.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/constants/text_strings.dart';

// class TSignUpForm extends StatelessWidget {
//   const TSignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TSignUpController>(
//       init: TSignUpController(),
//       builder: (controller) {
//         return Form(
//           key: controller.signupFormKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             children: [

//               const SizedBox(height: TSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.emailAddress,
//                 validator: controller._validateEmail,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: TTexts.email,
//                   prefixIcon: Icon(Iconsax.direct),
//                 ),
//               ),

//               const SizedBox(height: TSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.password,

//                 obscureText: !controller.passwordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Iconsax.password_check5),
//                   labelText: TTexts.password,
//                   suffixIcon: IconButton(
//                     icon: Icon(controller.passwordVisible
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: controller.togglePasswordVisibility,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.password,
//                 validator: controller._validatePassword,
//                 obscureText: !controller.passwordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Iconsax.password_check5),
//                   labelText: "Confirm Password",
//                   suffixIcon: IconButton(
//                     icon: Icon(controller.passwordVisible
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: controller.togglePasswordVisibility,
//                   ),
//                 ),
//               ),

//               // const TTermsAndConditionCheckbox(),
//               const SizedBox(height: TSizes.spaceBtwSections),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(

//                   onPressed: () async {
//                     if (controller.isProcessing) return;

//                     bool isValid = controller.validateForm();
//                     if (isValid) {
//                       await controller.signup();
//                     }
//                   },
//                   child: controller.isProcessing
//                       ? const CircularProgressIndicator()
//                       : const Text(TTexts.createAccount),
//                 ),
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),

//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class TSignUpController extends GetxController {
//   final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
//   bool passwordVisible = false;
//   bool isProcessing = false;
//   TextEditingController emailAddress = TextEditingController();
//   TextEditingController password = TextEditingController();

//   dynamic db = FirebaseFirestore.instance;

//   String? _validateEmail(String? value) {
//     if ((value == null || value.isEmpty)) {
//       return 'Please enter your email';
//     } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//         .hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if ((value == null || value.isEmpty)) {
//       return 'Please enter your password';
//     } else if (!RegExp(
//             r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
//         .hasMatch(value)) {
//       return 'Password must be have 8 character and contains 1 Uppercase, LowerCase, Digit & Special Character.';
//     }
//     return null;
//   }

//   void togglePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     update(); // Notify GetX that the state has changed
//   }

//   bool validateForm() {
//     if (signupFormKey.currentState?.validate() ?? false) {
//       return true;
//     }
//     return false;
//   }

//   Future<void> signup() async {
//     try {
//       // Check if the email or phone number already exists
//       QuerySnapshot emailQuery = await db
//           .collection("rest_owners")
//           .where("email", isEqualTo: emailAddress.text.trim())
//           .get();

//       if (emailQuery.docs.isNotEmpty ) {
//         Fluttertoast.showToast(
//             msg: "Email Or Phone Number Already Registered");
//         return;
//       } else {
//         final sharedPref = GetStorage();

//         sharedPref.write("signup_email", emailAddress.text.trim());

//         sharedPref.write("signup_password", password.text.trim());
//         Get.to(() => const VerifyEmailScreen());
//       }

//       isProcessing = false;
//       update(); // Notify GetX that the state has changed
//     } catch (e) {
//       debugPrint("Error: $e");
//       isProcessing = false;
//       update(); // Notify GetX that the state has changed
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:myrecipe_app/authentication/verify_email.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/constants/text_strings.dart';

// class TSignUpForm extends StatelessWidget {
//   const TSignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TSignUpController>(
//       init: TSignUpController(),
//       builder: (controller) {
//         return Form(
//           key: controller.signupFormKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             children: [
//               const SizedBox(height: TSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.emailAddress,
//                 validator: controller._validateEmail,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: TTexts.email,
//                   prefixIcon: Icon(Iconsax.direct),
//                 ),
//               ),

//               const SizedBox(height: TSizes.spaceBtwItems),
//               // TextFormField(
//               //   controller: controller.password,
//               //   obscureText: !controller.passwordVisible,
//               //   decoration: InputDecoration(
//               //     prefixIcon: const Icon(Iconsax.password_check5),
//               //     labelText: TTexts.password,
//               //     suffixIcon: IconButton(
//               //       icon: Icon(controller.passwordVisible
//               //           ? Icons.visibility_off
//               //           : Icons.visibility),
//               //       onPressed: controller.togglePasswordVisibility,
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               TextFormField(
//                 controller: controller.password,
//                 validator: controller._validatePassword,
//                 obscureText: !controller.passwordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Iconsax.password_check5),
//                   labelText: "Confirm Password",
//                   suffixIcon: IconButton(
//                     icon: Icon(controller.passwordVisible
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: controller.togglePasswordVisibility,
//                   ),
//                 ),
//               ),

//               // const TTermsAndConditionCheckbox(),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (controller.isProcessing) return;

//                     bool isValid = controller.validateForm();
//                     if (isValid) {
//                       await controller.signup();
//                     }
//                   },
//                   child: controller.isProcessing
//                       ? const CircularProgressIndicator()
//                       : const Text(
//                           TTexts.createAccount,style: TextStyle(color: Colors.black,fontSize: 15),
//                         ),
//                 ),
//               ),

//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class TSignUpController extends GetxController {
//   final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
//   bool passwordVisible = false;
//   bool isProcessing = false;
//   TextEditingController emailAddress = TextEditingController();
//   TextEditingController password = TextEditingController();

//   dynamic db = FirebaseFirestore.instance;

//   String? _validateEmail(String? value) {
//     if ((value == null || value.isEmpty)) {
//       return 'Please enter your email';
//     } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//         .hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if ((value == null || value.isEmpty)) {
//       return 'Please enter your password';
//     } else if (!RegExp(
//             r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
//         .hasMatch(value)) {
//       return 'Password must be have 8 character and contains 1 Uppercase, LowerCase, Digit & Special Character.';
//     }
//     return null;
//   }

//   void togglePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     update(); // Notify GetX that the state has changed
//   }

//   bool validateForm() {
//     if (signupFormKey.currentState?.validate() ?? false) {
//       return true;
//     }
//     return false;
//   }

//   Future<void> signup() async {
//     try {
//       // Check if the email or phone number already exists
//       QuerySnapshot emailQuery = await db
//           .collection("rest_owners")
//           .where("email", isEqualTo: emailAddress.text.trim())
//           .get();

//       if (emailQuery.docs.isNotEmpty) {
//         Fluttertoast.showToast(msg: "Email Already Registered");
//         return;
//       } else {
//         final sharedPref = GetStorage();

//         sharedPref.write("signup_email", emailAddress.text.trim());

//         sharedPref.write("signup_password", password.text.trim());
//         Get.to(() =>  const VerifyEmailScreen());
//       }

//       isProcessing = false;
//       update(); // Notify GetX that the state has changed
//     } catch (e) {
//       debugPrint("Error: $e");
//       isProcessing = false;
//       update(); // Notify GetX that the state has changed
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myrecipe_app/authentication/verify_email.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/constants/text_strings.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TSignUpController>(
      init: TSignUpController(),
      builder: (controller) {
        return Form(
          key: controller.signupFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: controller.emailAddress,
                validator: controller.validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: controller.password,
                obscureText: !controller.passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check5),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: controller.confirmPassword,
                validator: (value) => controller.validateConfirmPassword(
                    value, controller.password.text),
                obscureText: !controller.passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check5),
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(controller.passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.isProcessing) return;

                    bool isValid = controller.validateForm();
                    if (isValid) {
                      await controller.signup();
                    }
                  },
                  child: controller.isProcessing
                      ? const CircularProgressIndicator()
                      : Text(
                          TTexts.createAccount,
                          style: TextStyle(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.dark
                                  : TColors.light),
                        ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        );
      },
    );
  }
}

class TSignUpController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool isProcessing = false;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String? validateEmail(String? value) {
    if ((value == null || value.isEmpty)) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if ((value == null || value.isEmpty)) {
      return 'Please confirm your password';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    update(); // Notify GetX that the state has changed
  }

  bool validateForm() {
    if (signupFormKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }

  Future<void> signup() async {
    try {
      isProcessing = true;
      update(); // Notify GetX that the state has changed

      // Dummy email check to replace Firestore
      // You can replace this with your own logic to check for existing email
      if (emailAddress.text.trim() == "test@example.com") {
        Fluttertoast.showToast(msg: "Email or Phone Number already registered");
        isProcessing = false;
        update(); // Notify GetX that the state has changed
        return;
      } else {
        final sharedPref = GetStorage();
        sharedPref.write("signup_email", emailAddress.text.trim());
        sharedPref.write("signup_password", password.text.trim());

        // Navigate to verify email screen
        Get.to(() => const VerifyEmailScreen());
      }

      isProcessing = false;
      update(); // Notify GetX that the state has changed
    } catch (e) {
      debugPrint("Error: $e");
      Fluttertoast.showToast(
          msg: "Failed to create account. Please try again later.");
      isProcessing = false;
      update(); // Notify GetX that the state has changed
    }
  }
}
