import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';
import 'all_recipe.dart';
import 'recipe_controller.dart';
import 'recipe_model.dart';

class WishlistScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Wishlist',style: TextStyle(  color: THelperFunctions.isDarkMode(context)
                            ? Colors.amber
                            : const Color.fromARGB(255, 0, 128, 145),),),
      ),
      body: Obx(
        () {
          return StreamBuilder<List<RecipeModel>>(
            stream: _recipeController.getWishlist(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No recipes in wishlist'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  RecipeModel recipe = snapshot.data![index];
                  return ListTile(
                    leading: recipe.recipePhotoUrl.isNotEmpty
                        ? Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                recipe.recipePhotoUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Image not",
                                            style: TextStyle(fontSize: 12)),
                                        Text("found",
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Image not",
                                    style: TextStyle(fontSize: 12)),
                                Text("found", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                    title: Text(
                      recipe.recipeName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: THelperFunctions.isDarkMode(context)
                            ? Colors.amber
                            : const Color.fromARGB(255, 0, 128, 145),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          'Publisher : ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${recipe.recipePublisherName.capitalize}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600,
                                 color: THelperFunctions.isDarkMode(context)
                            ? Colors.amber
                            : const Color.fromARGB(255, 0, 128, 145),
                              ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 83, 71),
                      ),
                      onPressed: () {
                        _recipeController.removeFromWishlist(recipe);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsScreen(recipe: recipe),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}