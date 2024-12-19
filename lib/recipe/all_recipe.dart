// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/recipe_controller.dart';
// import 'package:recipe_app/recipe/wishlist_screen.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';
// import 'recipe_model.dart';

// class RecipeListScreen extends StatelessWidget {
//   final RecipeController _recipeController = Get.put(RecipeController());
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return
//     // Scaffold(
//     //   appBar: AppBar(
//     //     title: const Center(child: Text('All Recipes')),
//     //     actions: [
//     //     ],
//     //   ),
//     //   body:
//       StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No recipes found'));
//           }

//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Scrollbar(
//               thickness: 5,
//               interactive: true,
//               trackVisibility: true,
//               thumbVisibility: true,
//               controller: _scrollController,
//               child: GridView.builder(
//                 controller: _scrollController,
//                 padding: const EdgeInsets.all(8.0),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                 ),
//                 itemCount: snapshot.data!.docs.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == snapshot.data!.docs.length) {
//                     return Column(
//                       children: [
//                         Container(
//                           height: 200,
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 12),
//                           color: Colors.grey[200],
//                           child:
//                               const Center(child: Text('Promotional Banner')),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     );
//                   }

//                   RecipeModel recipe =
//                       RecipeModel.fromDocument(snapshot.data!.docs[index]);
//                   return _buildRecipeCard(context, recipe);
//                 },
//               ),
//             ),
//           );
//         },
//       // ),
//     );
//   }

//   Widget _buildRecipeCard(BuildContext context, RecipeModel recipe) {
//     return Card(
//       elevation: 10,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: Obx(() {
//         bool isInWishlist = Get.find<RecipeController>().isInWishlist(recipe);
//         return Container(
//           height: 200,
//           width: MediaQuery.of(context).size.width * 0.75,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 top: 170,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 86, 9, 0),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: AnimatedOpacity(
//                         opacity: 0.8,
//                         duration: const Duration(seconds: 2),
//                         child: Image.asset(
//                           "assets/foodbanner.jpg",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               RecipeDetailsScreen(recipe: recipe)),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (recipe.recipePhotoUrl.isNotEmpty)
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: Image.network(
//                             recipe.recipePhotoUrl,
//                             fit: BoxFit.cover,
//                             height: 200,
//                             width: double.infinity,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const SizedBox(
//                                 height: 200,
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     'Image not available',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           top: 4,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               recipe.recipeName,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Publisher: ${recipe.recipePublisherName}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Category: ${recipe.category}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Cooking Time: ${recipe.cookingTime} minutes',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Serving Size: ${recipe.servingSize}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.favorite,
//                     color: isInWishlist ? Colors.red : Colors.white,
//                   ),
//                   onPressed: () {
//                     Get.find<RecipeController>().toggleWishlistStatus(recipe);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/recipe/recipe_controller.dart';
import 'package:myrecipe_app/utils/constants/colors.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';
import 'recipe_model.dart';

class RecipeListScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.put(RecipeController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No recipes found'));
        }

        // Debug print to verify data
        print("Data fetched successfully");
        snapshot.data!.docs.forEach((doc) {
          print(doc.data());
        });

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            // thickness: 5,
            // interactive: true,
            // trackVisibility: true,
            // thumbVisibility: true,
            controller: _scrollController,
            child: Container(
              decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
            ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height *
                    0.8, // Example constraint
              ),
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: snapshot.data!.docs.length + 1,
                itemBuilder: (context, index) {
                  if (index == snapshot.data!.docs.length) {
                    return Column(
                      children: [
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          // color: Colors.grey[200],
                          // color: Colors.grey[200],
                          child:
                              const Center(child: Text('Promotional Banner')),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  RecipeModel recipe =
                      RecipeModel.fromDocument(snapshot.data!.docs[index]);
                  return _buildRecipeCard(context, recipe);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecipeCard(BuildContext context, RecipeModel recipe) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
      child: Obx(() {
        bool isInWishlist = Get.find<RecipeController>().isInWishlist(recipe);
        return Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Stack(
            children: [
              Positioned.fill(
                top: 170,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 86, 9, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AnimatedOpacity(
                        opacity: 0.8,
                        duration: const Duration(seconds: 2),
                        child: Image.asset(
                          "assets/foodbanner.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsScreen(recipe: recipe)),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (recipe.recipePhotoUrl.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            recipe.recipePhotoUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Image not available',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.recipeName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Publisher: ${recipe.recipePublisherName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Category: ${recipe.category}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Cooking Time: ${recipe.cookingTime} minutes',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Serving Size: ${recipe.servingSize}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isInWishlist ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    Get.find<RecipeController>().toggleWishlistStatus(recipe);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/recipe/recipe_controller.dart';
// import 'package:recipe_app/utils/helpers/helper_functions.dart';
// import 'recipe_model.dart';

// class RecipeListScreen extends StatelessWidget {
//   final RecipeController _recipeController = Get.put(RecipeController());
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return const Center(child: Text('No recipes found'));
//         }

//         // Debug print to verify data
//         print("Data fetched successfully");
//         snapshot.data!.docs.forEach((doc) {
//           print(doc.data());
//         });

//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Scrollbar(
//             thickness: 5,
//             interactive: true,
//             trackVisibility: true,
//             thumbVisibility: true,
//             controller: _scrollController,
//             child: GridView.builder(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: snapshot.data!.docs.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == snapshot.data!.docs.length) {
//                   return Column(
//                     children: [
//                       Container(
//                         height: 200,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 8, horizontal: 12),
//                         color: Colors.grey[200],
//                         child: const Center(child: Text('Promotional Banner')),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   );
//                 }

//                 RecipeModel recipe =
//                     RecipeModel.fromDocument(snapshot.data!.docs[index]);
//                 return _buildRecipeCard(context, recipe);
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildRecipeCard(BuildContext context, RecipeModel recipe) {
//     return Card(
//       elevation: 10,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: Obx(() {
//         bool isInWishlist = Get.find<RecipeController>().isInWishlist(recipe);
//         return Container(
//           height: 200,
//           width: MediaQuery.of(context).size.width * 0.75,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 top: 170,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 86, 9, 0),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: AnimatedOpacity(
//                         opacity: 0.8,
//                         duration: const Duration(seconds: 2),
//                         child: Image.asset(
//                           "assets/foodbanner.jpg",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               RecipeDetailsScreen(recipe: recipe)),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (recipe.recipePhotoUrl.isNotEmpty)
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: Image.network(
//                             recipe.recipePhotoUrl,
//                             fit: BoxFit.cover,
//                             height: 200,
//                             width: double.infinity,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const SizedBox(
//                                 height: 200,
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     'Image not available',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           top: 4,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               recipe.recipeName,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Publisher: ${recipe.recipePublisherName}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Category: ${recipe.category}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Cooking Time: ${recipe.cookingTime} minutes',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Serving Size: ${recipe.servingSize}',
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.favorite,
//                     color: isInWishlist ? Colors.red : Colors.white,
//                   ),
//                   onPressed: () {
//                     Get.find<RecipeController>().toggleWishlistStatus(recipe);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// class RecipeDetailsScreen extends StatelessWidget {
//   final RecipeModel recipe;

//   const RecipeDetailsScreen({Key? key, required this.recipe}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: const Icon(Icons.keyboard_arrow_left)),
//                     Text(
//                       recipe.recipeName.capitalize.toString(),
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 if (recipe.recipePhotoUrl.isNotEmpty)
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       recipe.recipePhotoUrl,
//                       fit: BoxFit.cover,
//                       height: 200,
//                       width: double.infinity,
//                       errorBuilder: (context, error, stackTrace) {
//                         return const Center(
//                           child: Text('Image not available'),
//                         );
//                       },
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'Published By : ',
//                             style: TextStyle(
//                               letterSpacing: 1,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: THelperFunctions.isDarkMode(context)
//                                   ? Colors.amber
//                                   : const Color.fromARGB(255, 0, 128, 145),
//                             ),
//                           ),
//                           Text(
//                             recipe.recipePublisherName.capitalize.toString(),
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       Row(
//                         children: [
//                           const Text('Category          :   '),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: THelperFunctions.isDarkMode(context)
//                                     ? Colors.amber
//                                     : const Color.fromARGB(255, 0, 128, 145),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Text(
//                               "  ${recipe.category}  ",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: THelperFunctions.isDarkMode(context)
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Text('Cooking Time  :  '),
//                           Text(
//                             ' ${recipe.cookingTime} minutes ',
//                             style: TextStyle(
//                               color: THelperFunctions.isDarkMode(context)
//                                   ? Colors.amber
//                                   : const Color.fromARGB(255, 0, 128, 145),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Text('Serving Size      :  '),
//                           Text(
//                             ' ${recipe.servingSize}',
//                             style: TextStyle(
//                               color: THelperFunctions.isDarkMode(context)
//                                   ? Colors.amber
//                                   : const Color.fromARGB(255, 0, 128, 145),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       const Text('Description       :'),
//                       const SizedBox(height: 10),
//                       Text(recipe.recipeDiscription),
//                       const SizedBox(height: 12),
//                       Stack(
//                         children: [
//                           const Positioned(
//                             child: Text('Ingredients        :'),
//                           ),
//                           Positioned(
//                             child: Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 125,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children:
//                                       recipe.ingredients.map((ingredient) {
//                                     return Text(
//                                       '- $ingredient',
//                                       style: TextStyle(
//                                         color:
//                                             THelperFunctions.isDarkMode(context)
//                                                 ? Colors.amber
//                                                 : const Color.fromARGB(
//                                                     255, 0, 128, 145),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.keyboard_arrow_left)),
                      Text(
                        recipe.recipeName.capitalize.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (recipe.recipePhotoUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        recipe.recipePhotoUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text('Image not available'),
                          );
                        },
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Published By : ',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: THelperFunctions.isDarkMode(context)
                                    ? Colors.amber
                                    : const Color.fromARGB(255, 0, 128, 145),
                              ),
                            ),
                            Text(
                              recipe.recipePublisherName.capitalize.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text('Category          :   '),
                            Container(
                              decoration: BoxDecoration(
                                  color: THelperFunctions.isDarkMode(context)
                                      ? Colors.amber
                                      : const Color.fromARGB(255, 0, 128, 145),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "  ${recipe.category}  ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: THelperFunctions.isDarkMode(context)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Cooking Time  :  '),
                            Text(
                              ' ${recipe.cookingTime} minutes ',
                              style: TextStyle(
                                color: THelperFunctions.isDarkMode(context)
                                    ? Colors.amber
                                    : const Color.fromARGB(255, 0, 128, 145),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Serving Size      :  '),
                            Text(
                              ' ${recipe.servingSize}',
                              style: TextStyle(
                                color: THelperFunctions.isDarkMode(context)
                                    ? Colors.amber
                                    : const Color.fromARGB(255, 0, 128, 145),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text('Description       :'),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _splitDescription(recipe.recipeDiscription)
                              .map((point) {
                            return Text('• $point');
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text('Ingredients        :'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: recipe.ingredients.map((ingredient) {
                                return Text(
                                  '- $ingredient',
                                  style: TextStyle(
                                    color: THelperFunctions.isDarkMode(context)
                                        ? Colors.amber
                                        : const Color.fromARGB(255, 0, 128, 145),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _splitDescription(String description) {
    List<String> points = [];
    int chunkSize = 100; // Set chunk size as needed
    for (int i = 0; i < description.length; i += chunkSize) {
      int end = (i + chunkSize < description.length)
          ? i + chunkSize
          : description.length;
      points.add(description.substring(i, end).trim());
    }
    return points;
  }
}
