// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myrecipe_app/authentication/signup_form.dart';
// import 'package:myrecipe_app/home_screen.dart';
// import 'package:myrecipe_app/utils/constants/colors.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

// class SignupController extends GetxController {
//   RxBool obscurePassword = true.obs;
//   RxBool isLoading = false.obs;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   final Connectivity _connectivity = Connectivity();

//   @override
//   void onInit() {
//     super.onInit();
//     _checkInternetConnection();
//   }

//   Future<void> _checkInternetConnection() async {
//     var connectivityResult = await _connectivity.checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.snackbar("No Internet", "Please check your internet connection",
//           colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
//     }
//   }

//   Future<void> handleSignIn() async {
//     try {
//       isLoading(true);
//       await googleSignIn.signOut(); // Ensure previous session is cleared
//       GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         String userName = googleSignInAccount.displayName ?? "Unknown";
//         String email = googleSignInAccount.email ?? "No Email";
//         String? photoUrl = googleSignInAccount.photoUrl;
//         String userId = googleSignInAccount.id;
//         GoogleSignInAuthentication googleAuth =
//             await googleSignInAccount.authentication;
//         AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         UserCredential authResult =
//             await _auth.signInWithCredential(credential);

//         if (authResult.user != null) {
//           Get.offAll(() => HomeScreen());
//           Fluttertoast.showToast(msg: "Account created successfully ! ");
//           // Get.snackbar("Success",
//           //     "Google Sign-in Successful with $userName and email : $email",
//           //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
//         }
//       }
//     } catch (error) {
//       print(error);
//       Get.snackbar("Sorry ! Please try again . . .", "Server-side issue",
//           colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
//     } finally {
//       isLoading(false);
//     }
//   }
// }

// class SignupScreen extends StatelessWidget {
//   final SignupController _signupController = Get.put(SignupController());
//   SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.turn_left,
//                 color: THelperFunctions.isDarkMode(context)
//                     ? Colors.white
//                     : Colors.black,
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Lets, Join Your Online Store . . ,",
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Text(
//                   "Jalaram Kirana",
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ),
//               const SizedBox(
//                 height: TSizes.spaceBtwSections,
//               ),
//               const TSignUpForm(),
//               const SizedBox(height: 10),
//               const Row(
//                 children: [
//                   Expanded(
//                     child: Divider(),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Or sign up with',
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Container(
//                   width: Get.width - 60,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 229, 229, 229),
//                     borderRadius: BorderRadius.circular(
//                         15), // Adjust the radius as needed
//                   ),
//                   child: TextButton.icon(
//                     onPressed: _signupController.isLoading.value
//                         ? null
//                         : _signupController.handleSignIn,
//                     icon: const Image(
//                       image: AssetImage('assets/google.png'),
//                       height: 30.0,
//                       width: 30.0,
//                     ),
//                     label: const Text(
//                       'Continue with Google',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myrecipe_app/authentication/signup_form.dart';
// import 'package:myrecipe_app/main_home_screen.dart';
// import 'package:myrecipe_app/utils/constants/colors.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

// class SignupController extends GetxController {
//   RxBool obscurePassword = true.obs;
//   RxBool isLoading = false.obs;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   final Connectivity _connectivity = Connectivity();

//   @override
//   void onInit() {
//     super.onInit();
//     _checkInternetConnection();
//   }

//   Future<void> _checkInternetConnection() async {
//     var connectivityResult = await _connectivity.checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.snackbar("No Internet", "Please check your internet connection",
//           colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
//     }
//   }

//   Future<void> handleSignIn() async {
//     try {
//       isLoading(true);
//       await googleSignIn.signOut(); // Ensure previous session is cleared
//       GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         String userName = googleSignInAccount.displayName ?? "Unknown";
//         String email = googleSignInAccount.email ?? "No Email";
//         String? photoUrl = googleSignInAccount.photoUrl;
//         String userId = googleSignInAccount.id;
//         GoogleSignInAuthentication googleAuth =
//             await googleSignInAccount.authentication;
//         AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         UserCredential authResult =
//             await _auth.signInWithCredential(credential);

//         if (authResult.user != null) {
//           Get.offAll(() => MainHomeScreen());
//           Fluttertoast.showToast(msg: "Account created successfully ! ");
//           // Get.snackbar("Success",
//           //     "Google Sign-in Successful with $userName and email : $email",
//           //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
//         }
//       }
//     } catch (error) {
//       print(error);
//       Get.snackbar("Sorry ! Please try again . . .", "Server-side issue",
//           colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
//     } finally {
//       isLoading(false);
//     }
//   }
// }

// class SignupScreen extends StatelessWidget {
//   final SignupController _signupController = Get.put(SignupController());
//   SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.turn_left,
//                 color: THelperFunctions.isDarkMode(context)
//                     ? Colors.white
//                     : Colors.black,
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Lets, Join Your Online Store . . ,",
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Text(
//                   "Jalaram Kirana",
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ),
//               const SizedBox(
//                 height:10,
//               ),
//               const TSignUpForm(),

//               const Row(
//                 children: [
//                   Expanded(
//                     child: Divider(),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Or sign up with',
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Center(
//                 child: Container(
//                   width: Get.width - 60,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 229, 229, 229),
//                     borderRadius: BorderRadius.circular(
//                         15), // Adjust the radius as needed
//                   ),
//                   child: TextButton.icon(
//                     onPressed: _signupController.isLoading.value
//                         ? null
//                         : _signupController.handleSignIn,
//                     icon: const Image(
//                       image: AssetImage('assets/logos/google-icon.png'),
//                       height: 30.0,
//                       width: 30.0,
//                     ),
//                     label: const Text(
//                       'Continue with Google',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myrecipe_app/authentication/signup_form.dart';
import 'package:myrecipe_app/main_home_screen.dart';
import 'package:myrecipe_app/navigation_menu.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class SignupController extends GetxController {
  RxBool obscurePassword = true.obs;
  RxBool isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar("No Internet", "Please check your internet connection",
          colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
    }
  }

  Future<void> handleSignIn() async {
    try {
      isLoading(true);
      await googleSignIn.signOut(); // Ensure previous session is cleared
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        String userName = googleSignInAccount.displayName ?? "Unknown";
        String email = googleSignInAccount.email ?? "No Email";
        String? photoUrl = googleSignInAccount.photoUrl;
        String userId = googleSignInAccount.id;
        GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential authResult =
            await _auth.signInWithCredential(credential);

        if (authResult.user != null) {
          Get.offAll(() => const NavigationScreen());
          Fluttertoast.showToast(msg: "Account created successfully ! ");
          // Get.snackbar("Success",
          //     "Google Sign-in Successful with $userName and email : $email",
          //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
        }
      }
    } catch (error) {
      print(error);
      Get.snackbar("Sorry ! Please try again . . .", "Server-side issue",
          colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
    } finally {
      isLoading(false);
    }
  }
}

class SignupScreen extends StatelessWidget {
  final SignupController _signupController = Get.put(SignupController());
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned.fill(
                top: 0,
                bottom: Get.height * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 244, 114, 54).withOpacity(0.9),
                            Colors.white.withOpacity(0.7),
                          ])),
                )),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.turn_left,
                          color: THelperFunctions.isDarkMode(context)
                              ? Colors.white
                              : Colors.black,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Lets, Create Your Account . . ,",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Taste Master",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSignUpForm(),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or sign up with',
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: Get.width - 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 229, 229),
                        borderRadius: BorderRadius.circular(
                            15), // Adjust the radius as needed
                      ),
                      child: TextButton.icon(
                        onPressed: _signupController.isLoading.value
                            ? null
                            : _signupController.handleSignIn,
                        icon: const Image(
                          image: AssetImage('assets/google.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                        label: const Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
