import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:myrecipe_app/navigation_menu.dart';
import 'package:myrecipe_app/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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

    _animation = Tween<double>(begin: 1, end: 4).animate(_controller);

    _controller.forward();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: 
               [Colors.amber.shade800,Colors.red,Colors.orange])
            ),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                    width: Get.width*0.8,
                    height: Get.height*0.7,
                    child: Lottie.asset('assets/animation/splash.json',
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void whereToGo() async {
    var sharedPref = GetStorage();
    await sharedPref.initStorage;
    var isLogin = sharedPref.read(keylogin);

    debugPrint("""Let's print the bool values\n
    1) Is login: $isLogin\n""");

    Timer(
      const Duration(seconds: 3),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          Get.offAll(() => NavigationScreen());
        } else {
          // Check if isLogin is not null and is true
          if (isLogin != null && isLogin) {
            Get.offAll(() => NavigationScreen());
          } else {
            Get.offAll(() => OnBoardingScreen());
          }
        }
      },
    );
  }
}

class GradientTextAnimation extends StatefulWidget {
  @override
  _GradientTextAnimationState createState() => _GradientTextAnimationState();
}

class _GradientTextAnimationState extends State<GradientTextAnimation> {
  List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  int _currentColorIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the animation loop
    _startAnimation();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _startAnimation() {
    // Create a repeating timer that updates the color index
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Change the color index
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _colors[_currentColorIndex],
            _colors[(_currentColorIndex + 1) % _colors.length],
          ],
        ),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            '  Recipe App  ',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
