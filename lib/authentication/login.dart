// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:myrecipe_app/authentication/forget.dart';
// import 'package:myrecipe_app/authentication/signup.dart';
// import 'package:myrecipe_app/home_screen.dart';
// import 'package:myrecipe_app/utils/constants/colors.dart';
// import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

// class LoginController extends GetxController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

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
//           colorText: Colors.red, backgroundColor: TColors.dark);
//     }
//   }

//   void login() async {
//     var connectivityResult = await _connectivity.checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.snackbar("No Internet", "Please check your internet connection",
//           colorText: Colors.red, backgroundColor: TColors.dark);
//       return;
//     }

//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     if (email.isEmpty || password.isEmpty) {
//       Fluttertoast.showToast(msg: "Please enter required fields");
//       // Get.snackbar("Error", "Please enter required fields",
//       //     colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
//     } else {
//       try {
//         isLoading(true);
//         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         if (userCredential.user != null) {
//           Get.offAll(() =>HomeScreen());
//           Fluttertoast.showToast(msg: "Login Successfully with $email");
//           // Get.snackbar("Success", "Login Successfully with $email",
//           //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
//         }
//       } on FirebaseAuthException catch (ex) {
//         Get.snackbar("Error", ex.message!,
//             colorText: Colors.red, backgroundColor: TColors.dark);
//       } finally {
//         isLoading(false);
//       }
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
//           Fluttertoast.showToast(msg:"Google Sign-in Successful with $userName and email : $email" );
//           // Get.snackbar("Success",
//           //     "Google Sign-in Successful with $userName and email : $email",
//           //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
//         }
//       }
//     } catch (error) {
//       print(error);
//       Get.snackbar("Sorry,Please try again", "Server issue",
//           colorText: Colors.red, backgroundColor: TColors.dark);
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> signOutGoogle() async {
//     await googleSignIn.signOut();
//     print("User signed out from Google account");
//   }

//   void goToSignUp() {
//     Get.to(() => SignupScreen());
//   }

//   void goToPhoneSignIn() {
//     //  Get.to(() => const PhoneSigninScreen());
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final LoginController _loginController = Get.put(LoginController());

//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Obx(() => Stack(
//               children: [
//                 ListView(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   children: [
//                     SizedBox(
//                       height: 300,
//                       width: 300,
//                       child: Image(
//                           image: THelperFunctions.isDarkMode(context)
//                               ? const AssetImage(
//                                   "assets/recipe logo.png")
//                               : const AssetImage(
//                                   "assets/recipe logo.png")),
//                     ),
//                     const Center(
//                       child: Text(
//                         "Welcome Back . . . !",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 2),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _loginController.emailController,
//                       decoration: const InputDecoration(
//                           labelText: "Email Address",
//                           prefixIcon: Icon(Icons.mail)),
//                     ),
//                     const SizedBox(height: 15),
//                     Obx(
//                       () => TextField(
//                         controller: _loginController.passwordController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.password),
//                           labelText: 'Password',
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _loginController.obscurePassword.value
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               _loginController.obscurePassword.toggle();
//                             },
//                           ),
//                         ),
//                         obscureText: _loginController.obscurePassword.value,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _loginController.isLoading.value
//                             ? null
//                             : _loginController.login,
//                         child: _loginController.isLoading.value
//                             ? LoadingAnimationWidget.staggeredDotsWave(
//                                 color: TColors.info, size: 30)
//                             : Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   color: THelperFunctions.isDarkMode(context)
//                                       ? TColors.L_highlight_text_bottom
//                                       : TColors.B_highlight_text_bottom,
//                                 ),
//                               ),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Get.to(() =>  ForgetPassword());
//                           },
//                           child: Text(
//                             'Forget password ?',
//                             style: TextStyle(
//                                 color: THelperFunctions.isDarkMode(context)
//                                     ? TColors.B_highlight_text_bottom
//                                     : TColors.L_highlight_text_bottom,
//                                 fontSize: 14),
//                           ),
//                         ),
//                         TextButton(
//                          // onPressed: _loginController.goToSignUp,
//                          onPressed:() {
//                            Get.to( SignupScreen());
//                          },
//                           child: Text(
//                             'Create Account',
//                             style: TextStyle(
//                                 color: THelperFunctions.isDarkMode(context)
//                                     ? TColors.B_highlight_text_bottom
//                                     : TColors.L_highlight_text_bottom,
//                                 fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const Row(
//                       children: [
//                         Expanded(
//                           child: Divider(),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'Or sign in with',
//                           ),
//                         ),
//                         Expanded(
//                           child: Divider(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       width: 250,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 229, 229, 229),
//                         borderRadius: BorderRadius.circular(
//                             15), // Adjust the radius as needed
//                       ),
//                       child: TextButton.icon(
//                         onPressed: _loginController.isLoading.value
//                             ? null
//                             : _loginController.handleSignIn,
//                         icon: const Image(
//                           image: AssetImage('assets/google.png'),

//                           height: 30.0,
//                           width: 30.0,
//                         ),
//                         label: const Text(
//                           'Continue with Google',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (_loginController.isLoading.value)
//                   Container(
//                     color: Colors.black.withOpacity(0.5),
//                     child: Center(
//                       child: LoadingAnimationWidget.fourRotatingDots(
//                           color: Colors.pinkAccent, size: 60),
//                       //CircularProgressIndicator(),
//                     ),
//                   ),
//               ],
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:myrecipe_app/authentication/forget.dart';
import 'package:myrecipe_app/authentication/signup.dart';
import 'package:myrecipe_app/main_home_screen.dart';
import 'package:myrecipe_app/navigation_menu.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  void login() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar("No Internet", "Please check your internet connection",
          colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
      return;
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter required fields");
      // Get.snackbar("Error", "Please enter required fields",
      //     colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
    } else {
      try {
        isLoading(true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (userCredential.user != null) {
          Get.offAll(() => NavigationScreen());
          Fluttertoast.showToast(msg: "Login Successfully with $email");
          // Get.snackbar("Success", "Login Successfully with $email",
          //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
        }
      } on FirebaseAuthException catch (ex) {
        Get.snackbar("Error", ex.message!,
            colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
      } finally {
        isLoading(false);
      }
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
          Get.offAll(() => NavigationScreen());
          Fluttertoast.showToast(
              msg:
                  "Google Sign-in Successful with $userName and email : $email");
          // Get.snackbar("Success",
          //     "Google Sign-in Successful with $userName and email : $email",
          //     colorText: Colors.green, backgroundColor: TColors.B_bg_Snackbar);
        }
      }
    } catch (error) {
      print(error);
      Get.snackbar("Sorry,Please try again", "Server issue",
          colorText: Colors.red, backgroundColor: TColors.B_bg_Snackbar);
    } finally {
      isLoading(false);
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    print("User signed out from Google account");
  }

  void goToSignUp() {
    Get.to(() => SignupScreen());
  }

  void goToPhoneSignIn() {
    //  Get.to(() => const PhoneSigninScreen());
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Positioned.fill(
                top: 0,
                bottom: Get.height*0.5,
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(255, 244, 114, 54).withOpacity(0.9),
                Colors.white.withOpacity(0.7),
                    ])),
              )),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image(
                        image: THelperFunctions.isDarkMode(context)
                            ? const AssetImage("assets/d_logo.png")
                            : const AssetImage("assets/recipe logo.png")),
                  ),
                  const Center(
                    child: Text(
                      "Welcome Back . . . !",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _loginController.emailController,
                    decoration: const InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => TextField(
                      controller: _loginController.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _loginController.obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _loginController.obscurePassword.toggle();
                          },
                        ),
                      ),
                      obscureText: _loginController.obscurePassword.value,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loginController.isLoading.value
                          ? null
                          : _loginController.login,
                      child: _loginController.isLoading.value
                          ? LoadingAnimationWidget.staggeredDotsWave(
                              color: TColors.Bbutton, size: 30)
                          : Text(
                              'Login',
                              style: TextStyle(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.dark
                                  : TColors.light),
                            ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => ForgetPassword());
                        },
                        child: Text(
                          'Forget password ?',
                          style: TextStyle(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.B_highlight_text_bottom
                                  : TColors.L_highlight_text_bottom,
                              fontSize: 14),
                        ),
                      ),
                      TextButton(
                        // onPressed: _loginController.goToSignUp,
                        onPressed: () {
                          Get.to(SignupScreen());
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.B_highlight_text_bottom
                                  : TColors.L_highlight_text_bottom,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or sign in with',
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 229, 229),
                      borderRadius: BorderRadius.circular(
                          15), // Adjust the radius as needed
                    ),
                    child: TextButton.icon(
                      onPressed: _loginController.isLoading.value
                          ? null
                          : _loginController.handleSignIn,
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
                ],
              ),
              if (_loginController.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: Colors.pinkAccent, size: 60),
                    //CircularProgressIndicator(),
                  ),
                ),
            ],
          )),
    );
  }
}
