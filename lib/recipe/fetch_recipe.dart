// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:myrecipe_app/recipe/recipe_model.dart';
// import 'package:myrecipe_app/recipe/ud_screen.dart';
// import 'package:myrecipe_app/user/controller.dart';

// class FetchRecipesScreen extends StatelessWidget {
//   final UserController _userController = Get.find<UserController>(); // Get instance of UserController

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Published Recipes'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('recipes')
//             .where('recipePublisherName', isEqualTo: '${_userController.user.value.fname} ${_userController.user.value.lname}')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('You have not published any recipes yet.'));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               RecipeModel recipe = RecipeModel.fromDocument(snapshot.data!.docs[index]);
//               return ListTile(
//                 title: Text(recipe.recipeName),
//                 subtitle: Text(recipe.category),
//                 onTap: () {
//                   // Navigate to Recipe Details screen when tapped
//                   Get.to(() => UDRecipeScreen(recipe: recipe));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myrecipe_app/recipe/recipe_model.dart';
import 'package:myrecipe_app/recipe/ud_screen.dart';
import 'package:myrecipe_app/user/controller.dart';

class FetchRecipesScreen extends StatelessWidget {
  final UserController _userController = Get.find<UserController>(); // Get instance of UserController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Published Recipes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('recipes')
            .where('recipePublisherName', isEqualTo: '${_userController.user.value.fname} ${_userController.user.value.lname}')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('You have not published any recipes yet.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              RecipeModel recipe = RecipeModel.fromDocument(snapshot.data!.docs[index]);
              return ListTile(
                title: Text(recipe.recipeName),
                subtitle: Text(recipe.category),
                onTap: () {
                  // Navigate to Recipe Details screen when tapped
                  Get.to(() => UDRecipeScreen(recipe: recipe));
                },
              );
            },
          );
        },
      ),
    );
  }
}