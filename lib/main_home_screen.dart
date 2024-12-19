import 'package:flutter/material.dart';
import 'package:myrecipe_app/home_header.dart';
import 'package:myrecipe_app/recipe/all_recipe.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Home_Header(),
            RecipeListScreen(),
          ],
        ),
      ),
    );
  }
}
