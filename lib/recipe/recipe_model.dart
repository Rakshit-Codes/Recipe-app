// import 'package:cloud_firestore/cloud_firestore.dart';

// class RecipeModel {
//   String recipeName;
//   String recipePublisherName;
//   int cookingTime;
//   String category;
//   String recipeDiscription;
//   List<String> ingredients;
//   String servingSize;
//   String recipePhotoUrl;
//   int? numOfLike;

//   RecipeModel({
//     required this.recipeName,
//     required this.recipePublisherName,
//     required this.cookingTime,
//     required this.category,
//     required this.recipeDiscription,
//     required this.ingredients,
//     required this.servingSize,
//     required this.recipePhotoUrl,
//     this.numOfLike,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'recipeName': recipeName,
//       'recipePublisherName': recipePublisherName,
//       'cookingTime': cookingTime,
//       'ingredients': ingredients,
//       'category': category,
//       'recipeDiscription': recipeDiscription,
//       'servingSize': servingSize,
//       'recipePhotoUrl': recipePhotoUrl,
//       'numOfLike': numOfLike,
//     };
//   }

//   factory RecipeModel.fromDocument(DocumentSnapshot doc) {
//     return RecipeModel(
//       recipeName: doc['recipeName'],
//       recipePublisherName: doc['recipePublisherName'],
//       category: doc['category'],
//       cookingTime: doc['cookingTime'],
//       recipeDiscription: doc['recipeDiscription'],
//       servingSize: doc['servingSize'],
//       recipePhotoUrl: doc['recipePhotoUrl'],
//       numOfLike: doc['numOfLike'],
//       ingredients: List<String>.from(doc['ingredients']),
//     );
//   }
// }






// import 'package:cloud_firestore/cloud_firestore.dart';

// class RecipeModel {
//   String recipeName;
//   String recipePublisherName;
//   int cookingTime;
//   String category;
//   String recipeDiscription;
//   List<String> ingredients;
//   String servingSize;
//   String recipePhotoUrl;
//   int? numOfLike;

//   RecipeModel({
//     required this.recipeName,
//     required this.recipePublisherName,
//     required this.cookingTime,
//     required this.category,
//     required this.recipeDiscription,
//     required this.ingredients,
//     required this.servingSize,
//     required this.recipePhotoUrl,
//     this.numOfLike,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'recipeName': recipeName,
//       'recipePublisherName': recipePublisherName,
//       'cookingTime': cookingTime,
//       'ingredients': ingredients,
//       'category': category,
//       'recipeDiscription': recipeDiscription,
//       'servingSize': servingSize,
//       'recipePhotoUrl': recipePhotoUrl,
//       'numOfLike': numOfLike,
//     };
//   }

//   factory RecipeModel.fromDocument(DocumentSnapshot doc) {
//     return RecipeModel(
//       recipeName: doc['recipeName'],
//       recipePublisherName: doc['recipePublisherName'],
//       category: doc['category'],
//       cookingTime: doc['cookingTime'],
//       recipeDiscription: doc['recipeDiscription'],
//       servingSize: doc['servingSize'],
//       recipePhotoUrl: doc['recipePhotoUrl'],
//       numOfLike: doc['numOfLike'],
//       ingredients: List<String>.from(doc['ingredients']),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String recipeName;
  String recipePublisherName;
  int cookingTime;
  String category;
  String recipeDiscription;
  List<String> ingredients;
  String servingSize;
  String recipePhotoUrl;
  int? numOfLike;

  RecipeModel({
    required this.recipeName,
    required this.recipePublisherName,
    required this.cookingTime,
    required this.category,
    required this.recipeDiscription,
    required this.ingredients,
    required this.servingSize,
    required this.recipePhotoUrl,
    this.numOfLike,
  });

  Map<String, dynamic> toMap() {
    return {
      'recipeName': recipeName,
      'recipePublisherName': recipePublisherName,
      'cookingTime': cookingTime,
      'ingredients': ingredients,
      'category': category,
      'recipeDiscription': recipeDiscription,
      'servingSize': servingSize,
      'recipePhotoUrl': recipePhotoUrl,
      'numOfLike': numOfLike,
    };
  }

  factory RecipeModel.fromDocument(DocumentSnapshot doc) {
    return RecipeModel(
      recipeName: doc['recipeName'],
      recipePublisherName: doc['recipePublisherName'],
      category: doc['category'],
      cookingTime: doc['cookingTime'],
      recipeDiscription: doc['recipeDiscription'],
      servingSize: doc['servingSize'],
      recipePhotoUrl: doc['recipePhotoUrl'],
      numOfLike: doc['numOfLike'],
      ingredients: List<String>.from(doc['ingredients']),
    );
  }
}
