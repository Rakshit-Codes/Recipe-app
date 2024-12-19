import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrecipe_app/utils/helpers/helper_functions.dart';
import 'all_recipe.dart';
import 'recipe_controller.dart';
import 'recipe_model.dart';


// Search Screen 

class RecipeHomeScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _recipeController.searchQuery.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: THelperFunctions.isDarkMode(context)
                      ? Colors.amber
                      : const Color.fromARGB(255, 0, 128, 145),
                ),
              ),
            ),
          ),
          Obx(() {
            final x = _recipeController.selectedFilter;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DropdownButton<String>(
                        value: x.value,
                        onChanged: (value) {
                          if (value != null) {
                            x.value = value;
                          }
                        },
                        items: [
                          'All',
                          'pizza',
                          'south',
                          'burger',
                          'north',
                          'bengali',
                          'gujarati'
                        ]
                            .map((filter) => DropdownMenuItem<String>(
                                  value: filter,
                                  child: Text(filter),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                ],
              ),
            );
          }),
          Expanded(
            child: Obx(
              () {
                List<RecipeModel> recipes =
                    _recipeController.filteredAndSortedRecipes;
                if (recipes.isEmpty) {
                  return const Center(child: Text('No recipes found'));
                }

                return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    RecipeModel recipe = recipes[index];
                    return ListTile(
                      leading: recipe.recipePhotoUrl.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(recipe.recipePhotoUrl,
                                  width: 80, height: 60, fit: BoxFit.cover),
                            )
                          : const Icon(Icons.image_not_supported),
                      title: Text(
                        '${recipe.recipeName.capitalize}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: THelperFunctions.isDarkMode(context)
                              ? Colors.amber
                              : const Color.fromARGB(255, 0, 128, 145),
                        ),
                      ),

                      subtitle: Row(
                        children: [
                          const Text(
                            'Publisher : ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${recipe.recipePublisherName.capitalize}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: THelperFunctions.isDarkMode(context)
                                  ? Colors.amber
                                  : const Color.fromARGB(255, 0, 128, 145),
                            ),
                          ),
                        ],
                      ),
                      // Text(''),
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
            ),
          ),
          
        ],
      ),
    );
  }
}
