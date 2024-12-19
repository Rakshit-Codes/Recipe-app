import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/recipe_controller.dart';
import 'package:myrecipe_app/recipe/recipe_model.dart';
import 'package:myrecipe_app/user/controller.dart';

class UpdateRecipeScreen extends StatelessWidget {
  final RecipeModel recipe;
  final RecipeController _recipeController = Get.put(RecipeController());
  final UserController _userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UpdateRecipeScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    _recipeController.recipe.value = recipe;
    _recipeController.ingredientControllers.value = recipe.ingredients.map((ingredient) {
      TextEditingController controller = TextEditingController(text: ingredient);
      return controller;
    }).toList().obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_recipeController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _recipeController.updateRecipePhoto(
                        _recipeController.recipe.value.recipeName),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: _recipeController
                              .recipe.value.recipePhotoUrl.isNotEmpty
                          ? NetworkImage(
                              _recipeController.recipe.value.recipePhotoUrl)
                          : null,
                      child:
                          _recipeController.recipe.value.recipePhotoUrl.isEmpty
                              ? Icon(Icons.camera_alt, size: 80)
                              : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Publisher: ${_userController.user.value.fname} ${_userController.user.value.lname}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: recipe.recipeName,
                    decoration: InputDecoration(labelText: 'Recipe Name'),
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.recipeName = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the recipe name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: recipe.cookingTime.toString(),
                    decoration: InputDecoration(labelText: 'Cooking Time'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.cookingTime = int.parse(value ?? '0');
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the cooking time';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: recipe.category,
                    decoration: InputDecoration(labelText: 'Category'),
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.category = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the category';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: recipe.recipeDiscription,
                    decoration: InputDecoration(labelText: 'Recipe Description'),
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.recipeDiscription = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the recipe description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    return Column(
                      children: [
                        for (int i = 0; i < _recipeController.ingredientControllers.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _recipeController.ingredientControllers[i],
                                    decoration: InputDecoration(
                                      labelText: 'Ingredient ${i + 1}',
                                      border: OutlineInputBorder(),
                                    ),
                                    onSaved: (value) {
                                      _recipeController.ingredientControllers[i].text = value ?? '';
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an ingredient';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                if (_recipeController.ingredientControllers.length > 1)
                                  IconButton(
                                    icon: Icon(Icons.remove_circle),
                                    onPressed: () {
                                      _recipeController.removeIngredient(i);
                                    },
                                  ),
                              ],
                            ),
                          ),
                      ],
                    );
                  }),
                  SizedBox(height: 10),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('Add Ingredient'),
                      onPressed: () {
                        _recipeController.addIngredient();
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: recipe.servingSize,
                    decoration: InputDecoration(labelText: 'Serving Size'),
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.servingSize = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the serving size';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        _recipeController.recipe.update((val) {
                          if (val != null) {
                            val.recipePublisherName =
                                '${_userController.user.value.fname} ${_userController.user.value.lname}';
                            val.ingredients = _recipeController.ingredientControllers.map((controller) => controller.text).toList();
                          }
                        });
                        await _recipeController.updateRecipe(_recipeController.recipe.value);
                        Get.back(); // Return to previous screen after update
                      }
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}