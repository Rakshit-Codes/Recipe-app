// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myrecipe_app/recipe/recipe_controller.dart';
// import 'package:myrecipe_app/user/controller.dart';

// class PublishRecipeScreen extends StatelessWidget {
//   final RecipeController _recipeController = Get.put(RecipeController());
//   final UserController _userController = Get.put(UserController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Publish Recipe'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           if (_recipeController.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () => _recipeController.pickRecipePhoto(
//                         _recipeController.recipe.value.recipeName),
//                     child: CircleAvatar(
//                       radius: 80,
//                       backgroundImage: _recipeController
//                               .recipe.value.recipePhotoUrl.isNotEmpty
//                           ? NetworkImage(
//                               _recipeController.recipe.value.recipePhotoUrl)
//                           : null,
//                       child:
//                           _recipeController.recipe.value.recipePhotoUrl.isEmpty
//                               ? const Icon(Icons.camera_alt, size: 80)
//                               : null,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Publisher: ${_userController.user.value.fname} ${_userController.user.value.lname}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: const InputDecoration(labelText: 'Recipe Name'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.recipeName = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the recipe name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Cooking Time'),
//                     keyboardType: TextInputType.number,
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.cookingTime = int.parse(value ?? '0');
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the cooking time';
//                       }
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter a valid number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: const InputDecoration(labelText: 'Category'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.category = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the category';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Recipe Instructions'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.recipeDiscription = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the recipe Instructions ';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   Obx(() {
//                     return Column(
//                       children: [
//                         for (int i = 0;
//                             i < _recipeController.ingredientControllers.length;
//                             i++)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextFormField(
//                                     controller: _recipeController
//                                         .ingredientControllers[i],
//                                     decoration: InputDecoration(
//                                       labelText: 'Ingredient ${i + 1}',
//                                       border: const OutlineInputBorder(),
//                                     ),
//                                     onSaved: (value) {
//                                       _recipeController.ingredientControllers[i]
//                                           .text = value ?? '';
//                                     },
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter an ingredient';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ),
//                                 if (_recipeController
//                                         .ingredientControllers.length >
//                                     1)
//                                   IconButton(
//                                     icon: const Icon(Icons.remove_circle),
//                                     onPressed: () {
//                                       _recipeController.removeIngredient(i);
//                                     },
//                                   ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     );
//                   }),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: Get.width,
//                     child: ElevatedButton.icon(
//                       icon: const Icon(Icons.add),
//                       label: const Text('Add Ingredient'),
//                       onPressed: () {
//                         _recipeController.addIngredient();
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Serving Size'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.servingSize = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the serving size';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         _formKey.currentState?.save();
//                         _recipeController.recipe.update((val) {
//                           if (val != null) {
//                             val.recipePublisherName =
//                                 '${_userController.user.value.fname} ${_userController.user.value.lname}' ;
//                             val.ingredients = _recipeController
//                                 .ingredientControllers
//                                 .map((controller) => controller.text)
//                                 .toList();
//                           }
//                         });
//                         await _recipeController.publishRecipe();
//                       }
//                     },
//                     child: const Text('Publish'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myrecipe_app/recipe/recipe_controller.dart';
// import 'package:myrecipe_app/user/controller.dart';
// import 'package:myrecipe_app/utils/constants/colors.dart';
// import 'package:myrecipe_app/utils/constants/sizes.dart';
// import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

// class PublishRecipeScreen extends StatelessWidget {
//   final RecipeController _recipeController = Get.put(RecipeController());
//   final UserController _userController = Get.put(UserController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Publish Recipe'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           if (_recipeController.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () => _recipeController.uploadRecipePhoto(
//                         _recipeController.recipe.value.recipeName),
//                     child: CircleAvatar(
//                       radius: 80,
//                       backgroundImage: _recipeController
//                               .recipe.value.recipePhotoUrl.isNotEmpty
//                           ? NetworkImage(
//                               _recipeController.recipe.value.recipePhotoUrl)
//                           : null,
//                       child:
//                           _recipeController.recipe.value.recipePhotoUrl.isEmpty
//                               ? const Icon(Icons.camera_alt, size: 80)
//                               : null,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Publisher: ${_userController.user.value.fname} ${_userController.user.value.lname}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: const InputDecoration(labelText: 'Recipe Name'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.recipeName = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the recipe name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Cooking Time'),
//                     keyboardType: TextInputType.number,
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.cookingTime = int.parse(value ?? '0');
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the cooking time';
//                       }
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter a valid number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: const InputDecoration(labelText: 'Category'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.category = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the category';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Recipe Instructions'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.recipeDiscription = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the recipe Instructions ';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   Obx(() {
//                     return Column(
//                       children: [
//                         for (int i = 0;
//                             i < _recipeController.ingredientControllers.length;
//                             i++)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextFormField(
//                                     controller: _recipeController
//                                         .ingredientControllers[i],
//                                     decoration: InputDecoration(
//                                       labelText: 'Ingredient ${i + 1}',
//                                       border: const OutlineInputBorder(),
//                                     ),
//                                     onSaved: (value) {
//                                       _recipeController.ingredientControllers[i]
//                                           .text = value ?? '';
//                                     },
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter an ingredient';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ),
//                                 if (_recipeController
//                                         .ingredientControllers.length >
//                                     1)
//                                   IconButton(
//                                     icon: const Icon(Icons.remove_circle),
//                                     onPressed: () {
//                                       _recipeController.removeIngredient(i);
//                                     },
//                                   ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     );
//                   }),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: Get.width * 0.4,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 5,
//                         backgroundColor: TColors.Swg,
//                         side: const BorderSide(color: Colors.transparent),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                       ),
//                       onPressed: () {
//                         _recipeController.addIngredient();
//                       },
//                       child: Text(
//                         "+ Add Ingredients",
//                         style: TextStyle(
//                           color: THelperFunctions.isDarkMode(context)
//                               ? TColors.dark
//                               : TColors.light,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration:
//                         const InputDecoration(labelText: 'Serving Size'),
//                     onSaved: (value) {
//                       _recipeController.recipe.update((val) {
//                         if (val != null) {
//                           val.servingSize = value ?? '';
//                         }
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the serving size';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: Get.width * 0.4,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 5,
//                         backgroundColor: TColors.Swg,
//                         side: const BorderSide(color: Colors.transparent),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                       ),
//                       onPressed: () async {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         _formKey.currentState?.save();
//                         _recipeController.recipe.update((val) {
//                           if (val != null) {
//                             val.recipePublisherName =
//                                 '${_userController.user.value.fname} ${_userController.user.value.lname}';
//                             val.ingredients = _recipeController
//                                 .ingredientControllers
//                                 .map((controller) => controller.text)
//                                 .toList();
//                           }
//                         });
//                         await _recipeController.publishRecipe();
//                       }
//                     },
//                       child: Text(
//                         "Publish",
//                         style: TextStyle(
//                           color: THelperFunctions.isDarkMode(context)
//                               ? TColors.dark
//                               : TColors.light,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/recipe_controller.dart';
import 'package:myrecipe_app/user/controller.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/constants/sizes.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';

class PublishRecipeScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.put(RecipeController());
  final UserController _userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_recipeController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
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
                              ? const Icon(Icons.camera_alt, size: 80)
                              : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Publisher: ${_userController.user.value.fname} ${_userController.user.value.lname}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Recipe Name'),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Cooking Time'),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Category'),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Recipe Instructions'),
                    onSaved: (value) {
                      _recipeController.recipe.update((val) {
                        if (val != null) {
                          val.recipeDiscription = value ?? '';
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the recipe Instructions ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return Column(
                      children: [
                        for (int i = 0;
                            i < _recipeController.ingredientControllers.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _recipeController
                                        .ingredientControllers[i],
                                    decoration: InputDecoration(
                                      labelText: 'Ingredient ${i + 1}',
                                      border: const OutlineInputBorder(),
                                    ),
                                    onSaved: (value) {
                                      _recipeController.ingredientControllers[i]
                                          .text = value ?? '';
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an ingredient';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                if (_recipeController
                                        .ingredientControllers.length >
                                    1)
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle),
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
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: TColors.Swg,
                        side: const BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      onPressed: () {
                        _recipeController.addIngredient();
                      },
                      child: Text(
                        "+ Add Ingredients",
                        style: TextStyle(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Serving Size'),
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: TColors.Swg,
                        side: const BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          _recipeController.recipe.update((val) {
                            if (val != null) {
                              val.recipePublisherName =
                                  '${_userController.user.value.fname} ${_userController.user.value.lname}';
                              val.ingredients = _recipeController
                                  .ingredientControllers
                                  .map((controller) => controller.text)
                                  .toList();
                            }
                          });
                          await _recipeController.publishRecipe();
                        }
                      },
                      child: Text(
                        "Publish",
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
            ),
          );
        }),
      ),
    );
  }
}
