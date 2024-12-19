import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/recipe_home_screnn.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class Search_Bar extends StatefulWidget {
  final TextEditingController controller;
  final List<String> hintTexts;
  final Function(String)? onChanged;
  final VoidCallback? onSearch;
  final VoidCallback? onClear;
  final VoidCallback? onMic;
  final VoidCallback? onTap;


  const Search_Bar({
    Key? key,
    required this.controller,
    required this.hintTexts,
    this.onChanged,
    this.onSearch,
    this.onClear,
    this.onMic,
    this.onTap,
  }) : super(key: key);

  @override
  _Search_BarState createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  late String _currentHintText;
  late Timer _timer;
  int _hintIndex = 0;

  @override
  void initState() {
  
    super.initState();
    _currentHintText = widget.hintTexts[_hintIndex];
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      setState(() {
     
        _hintIndex = (_hintIndex + 1) % widget.hintTexts.length;
        _currentHintText = widget.hintTexts[_hintIndex];
      });
    });
  }

  @override
  void dispose() {
    
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(RecipeHomeScreen());
      },
      child: TextField(
        onTap: widget.onTap,
        cursorColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(
              width: 1,
              color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
            borderSide: BorderSide(
              width: 1,
              color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
          ),
          fillColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light.withOpacity(0.8),
          filled: true,
          hintText: _currentHintText,
          hintStyle: TextStyle(
            color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            onPressed: widget.onSearch,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.controller.text.isNotEmpty)
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                  ),
                  onPressed: widget.onClear,
                )
              else
                IconButton(
                  icon: Icon(
                    Icons.mic,
                    color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                  ),
                  onPressed: widget.onMic,
                ),
            ],
          ),
        ),
      ),
    );
  }
}