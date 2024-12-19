import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/recipe_controller.dart';
import 'package:myrecipe_app/recipe/recipe_model.dart';
import 'package:myrecipe_app/recipe/updart_recipe.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class UDRecipeScreen extends StatelessWidget {
  final RecipeModel recipe;
  final RecipeController _recipeController = Get.put(RecipeController());

  UDRecipeScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update / Delete Recipe'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recipe Name: ${recipe.recipeName}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Category: ${recipe.category}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Cooking Time: ${recipe.cookingTime} minutes',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Serving Size: ${recipe.servingSize}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Recipe Description:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${recipe.recipeDiscription}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 16),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.ingredients.map((ingredient) {
                  return Text('- $ingredient');
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Navigate to Update Recipe screen
                  //     Get.to(() => UpdateRecipeScreen(recipe: recipe));
                  //   },
                  //   child: Text('Update Recipe'),
                  // ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: TColors.Swg,
                        side: const BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      onPressed: () {
                        Get.to(() => UpdateRecipeScreen(recipe: recipe));
                    },
                      child: Text(
                        "Update Recipe",
                        style: TextStyle(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
                        ),
                      ),
                    ),
                  ),





                  // ElevatedButton(
                  //   onPressed: () async {
                  //     // Delete recipe functionality
                  //     await _recipeController.deleteRecipe(recipe);
                  //     Get.back(); // Return to previous screen after deletion
                  //   },
                  //   child: Text('Delete Recipe'),
                  // ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: TColors.Swg,
                        side: const BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      onPressed: () async {
                      // Delete recipe functionality
                      await _recipeController.deleteRecipe(recipe);
                      Get.back(); // Return to previous screen after deletion
                    },
                      child: Text(
                        "Delete Recipe",
                        style: TextStyle(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}