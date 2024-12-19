import 'package:flutter/material.dart';

class DUI {
  static Widget customTextField(TextEditingController emailController, String s, IconData mail, bool bool, {
    required TextEditingController controller,
    required String hintText,
    required double fontsize,
    required IconData? iconData,
    bool obscureText = false,
    Color textColor = Colors.black,
    Color hintColor = Colors.grey,
    double borderRadius = 10.0,
    double borderWidth = 1.0,
    Color borderColor = Colors.grey,
  }) {
    return TextFormField(
      style: TextStyle(color: textColor),
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '#',
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor,fontSize:fontsize ),
        prefixIcon: Icon(iconData, color: hintColor),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
    );
  }

  static Widget customButton(Null Function() param0, {
    required VoidCallback onPressed,
    required String text,
    Color buttonColor = Colors.blue,
    Color textColor = Colors.white,
    double buttonHeight = 55.0,
    double buttonWidth = 225.0,
    double borderRadius = 30.0,
  }) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
         
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  static Future<void> customAlertBox(
    BuildContext context,
    String text, {
    Color backgroundColor = const Color.fromARGB(237, 255, 255, 255),
    Color textColor = const Color.fromARGB(255, 97, 6, 0),
    Color buttonColor = Colors.blue,
    Color buttonTextColor = Colors.white,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: buttonTextColor,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }


  static void showSnackBar(
    BuildContext context,
    String message,  {
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

}