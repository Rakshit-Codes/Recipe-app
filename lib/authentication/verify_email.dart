// import 'dart:convert';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:myrecipe_app/create_account.dart';
// import 'package:myrecipe_app/utils/constants/image_strings.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/constants/text_strings.dart';
// import 'package:myrecipe_app/utils/helpers/helper_functions.dart';


// class VerifyEmailScreen extends StatefulWidget {
//   const VerifyEmailScreen({super.key});

//   @override
//   VerifyEmailScreenState createState() => VerifyEmailScreenState();
// }

// class VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   TextEditingController otpController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   int randomCode = 0;
//   bool isOtpVerified = false;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     randomCode = Random().nextInt(9000) + 1000;
//     _verifyEmail();
//   }

//   Future<void> _verifyEmail() async {
//     const String otpUrl =
//         'https://syntaxium.in/DUSTBIN_API/hunger_haven_otp.php';
//     setState(() {
//       isLoading = true;
//     });
//     final sharedPref = GetStorage();

//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//       };

//       // Define request body
//       Map<String, String> otpBody = {
//         "email": sharedPref.read("signup_email"),
//         "otp": randomCode.toString(),
//       };
//       // Use the http.post method with headers and body
//       var response = await http.post(
//         Uri.parse(otpUrl),
//         headers: headers,
//         body: otpBody,
//       );
//       var result = jsonDecode(response.body);
//       debugPrint(response.body);
//       bool er = result["error"];
//       if (response.statusCode == 200 && er == false) {
//         Fluttertoast.showToast(
//           msg: result["message"],
//         );
//       } else {
//         // Request failed
//         Fluttertoast.showToast(
//           msg: result["message"],
//         );
//         debugPrint('Error during otp: ${response.reasonPhrase}');
//       }
//     } catch (error) {
//       // Handle network or other errors
//       debugPrint('Error during otp: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void verifyOtp() async {
//     if (randomCode.toString() != otpController.text.toString()) {
//       Fluttertoast.showToast(msg: "Incorrect Otp Entered");
//       isOtpVerified = false;
//     } else {
//       Fluttertoast.showToast(msg: "Otp Verified Successfully !");
//       isOtpVerified = true;
//       _signup();
//     }
//   }

//   void _signup() async {
//     var sharedPref = GetStorage();
//     sharedPref.initStorage;
//     var user = <String, dynamic>{};
//     user = {
//       "email": sharedPref.read("signup_email").toString(),
//     };

//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final credential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//             email: sharedPref.read("signup_email"),
//             password: sharedPref.read("signup_password"));
//     debugPrint(credential.user.toString());

//     Fluttertoast.showToast(msg: "Signup Success");
//     //Future.delayed(const Duration(seconds: 2));
//     Get.offAll(() => const AccountCreatedSuccessScreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               //image
//               Image(
//                 height: 250,
//                 image: const AssetImage(TImages.deliveredEmailIllustration),
//                 width: THelperFunctions.screenWidth(),
//               ),
//               Text(
//                 TTexts.confirmEmail,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(
//                 height: TSizes.spaceBtwItems,
//               ),

//               Text(
//                 'jalaramkirana@gmail.com',
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(
//                 height: TSizes.spaceBtwItems,
//               ),

//               Text(
//                 TTexts.confirmEmailSubTitle,
//                 style: Theme.of(context).textTheme.labelMedium,
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(
//                 height: TSizes.spaceBtwSections,
//               ),

//               Form(
//                 child: TextFormField(
//                   controller: otpController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.password),
//                     labelText: "Otp",
//                   ),
//                   maxLength: 4,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       side: const BorderSide(color: Colors.amber)),
//                   onPressed: (isLoading && isOtpVerified)
//                       ? null
//                       : () async {
//                           verifyOtp();
//                         },
//                   child: const Text('Verify'),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               if (isLoading) const CircularProgressIndicator(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'dart:math';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:myrecipe_app/create_account.dart';
// import 'package:myrecipe_app/utils/constants/image_strings.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/constants/text_strings.dart';

// class VerifyEmailScreen extends StatefulWidget {
//   const VerifyEmailScreen({super.key});

//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }

// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   TextEditingController otpController = TextEditingController();
//   int randomCode = 0;
//   bool isLoading = false;
//   late GetStorage sharedPref; // Declare sharedPref variable

//   @override
//   void initState() {
//     super.initState();
//     sharedPref = GetStorage(); // Initialize sharedPref in initState
//     randomCode = Random().nextInt(9000) + 1000;
//     _verifyEmail();
//   }

//   Future<void> _verifyEmail() async {
//     const String otpUrl = 'https://syntaxium.in/DUSTBIN_API/hunger_haven_otp.php';
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//       };

//       Map<String, String> otpBody = {
//         "email": sharedPref.read("signup_email"),
//         "otp": randomCode.toString(),
//       };

//       var response = await http.post(
//         Uri.parse(otpUrl),
//         headers: headers,
//         body: otpBody,
//       );

//       var result = jsonDecode(response.body);
//       debugPrint(response.body);

//       bool error = result["error"];
//       if (response.statusCode == 200 && !error) {
//         Fluttertoast.showToast(msg: result["message"]);
//       } else {
//         Fluttertoast.showToast(msg: result["message"]);
//         debugPrint('Error during OTP: ${response.reasonPhrase}');
//       }
//     } catch (error) {
//       debugPrint('Error during OTP: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }


//   void verifyOtp() async {
//     if (randomCode.toString() != otpController.text.toString()) {
//       Fluttertoast.showToast(msg: "Incorrect OTP entered");
//     } else {
//       Fluttertoast.showToast(msg: "OTP Verified Successfully!");
//       // Proceed to sign up the user
//       await signUpUser();
//     }
//   }
//   Future<void> signUpUser() async {
//   try {
//     String email = sharedPref.read("signup_email");
//     String password = sharedPref.read("signup_password");

//     // Create user with email and password using Firebase Auth
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // Navigate to success screen after successful signup
//     Get.offAll(() => const AccountCreatedSuccessScreen());

//   } catch (e) {
//     Fluttertoast.showToast(msg: "Sign up failed: $e");
//     debugPrint("Error during sign up: $e");
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               Image(
//                 height: 250,
//                 image: const AssetImage(TImages.deliveredEmailIllustration),
//                 width: MediaQuery.of(context).size.width,
//               ),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               const Text(
//                 TTexts.confirmEmail,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               Text(
//                 sharedPref.read("signup_email") ?? '',
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               const Text(
//                 TTexts.confirmEmailSubTitle,
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),
//               Form(
//                 child: TextFormField(
//                   controller: otpController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.password),
//                     labelText: "OTP",
//                   ),
//                   maxLength: 4,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: isLoading ? Colors.grey : Colors.green,
//                     side: const BorderSide(color: Colors.amber),
//                   ),
//                   onPressed: isLoading ? null : () => verifyOtp(),
//                   child: const Text('Verify'),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               if (isLoading) const CircularProgressIndicator(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:myrecipe_app/create_account.dart';
import 'package:myrecipe_app/utils/constants/image_strings.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController otpController = TextEditingController();
  int randomCode = 0;
  bool isLoading = false;
  late GetStorage sharedPref; // Declare sharedPref variable

  @override
  void initState() {
    super.initState();
    sharedPref = GetStorage(); // Initialize sharedPref in initState
    randomCode = Random().nextInt(9000) + 1000;
    _verifyEmail();
  }

  Future<void> _verifyEmail() async {
    const String otpUrl =
        'https://syntaxium.in/DUSTBIN_API/hunger_haven_otp.php';
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      };

      Map<String, String> otpBody = {
        "email": sharedPref.read("signup_email"),
        "otp": randomCode.toString(),
      };

      var response = await http.post(
        Uri.parse(otpUrl),
        headers: headers,
        body: otpBody,
      );

      var result = jsonDecode(response.body);
      debugPrint(response.body);

      bool error = result["error"];
      if (response.statusCode == 200 && !error) {
        Fluttertoast.showToast(msg: result["message"]);
      } else {
        Fluttertoast.showToast(msg: result["message"]);
        debugPrint('Error during OTP: ${response.reasonPhrase}');
      }
    } catch (error) {
      debugPrint('Error during OTP: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void verifyOtp() async {
    if (randomCode.toString() != otpController.text.toString()) {
      Fluttertoast.showToast(msg: "Incorrect OTP entered");
    } else {
      Fluttertoast.showToast(msg: "OTP Verified Successfully!");
      // Proceed to sign up the user
      await signUpUser();
    }
  }

  Future<void> signUpUser() async {
    try {
      String email = sharedPref.read("signup_email");
      String password = sharedPref.read("signup_password");

      // Create user with email and password using Firebase Auth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to success screen after successful signup
      Get.offAll(() => const AccountCreatedSuccessScreen());
    } catch (e) {
      Fluttertoast.showToast(msg: "Sign up failed: $e");
      debugPrint("Error during sign up: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                height: 250,
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                TTexts.confirmEmail,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                sharedPref.read("signup_email") ?? '',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text(
                TTexts.confirmEmailSubTitle,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Form(
                child: TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "OTP",
                  ),
                  maxLength: 4,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLoading ? Colors.grey : Colors.green,
                    side: const BorderSide(color: Colors.amber),
                  ),
                  onPressed: isLoading ? null : () => verifyOtp(),
                  child: const Text('Verify'),
                ),
              ),
              const SizedBox(height: 16),
              if (isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}