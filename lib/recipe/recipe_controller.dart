// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'recipe_model.dart';

// class RecipeController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   var isLoading = false.obs;
//   var recipe = RecipeModel(
//     recipeName: '',
//     recipePublisherName: '',
//     cookingTime: 0,
//     category: '',
//     recipeDiscription: '',
//     ingredients: [],
//     servingSize: '',
//     recipePhotoUrl: '',
//     numOfLike: 0,
//   ).obs;

//   var ingredientControllers = <TextEditingController>[TextEditingController()].obs;

//   void addIngredient() {
//     ingredientControllers.add(TextEditingController());
//   }

//   void removeIngredient(int index) {
//     if (ingredientControllers.length > 1) {
//       ingredientControllers.removeAt(index);
//     }
//   }

//   Future<void> publishRecipe() async {
//     if (recipe.value.recipePhotoUrl.isEmpty) {
//       Get.snackbar('Error', 'Please upload a recipe photo before publishing.');
//       return;
//     }

//     isLoading.value = true;
//     try {
//       recipe.update((val) {
//         if (val != null) {
//           val.ingredients = ingredientControllers.map((controller) => controller.text).toList();
//         }
//       });
//       await _firestore.collection('recipes').doc(recipe.value.recipeName).set(recipe.value.toMap());
//       Get.snackbar('Success', 'Recipe published successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to publish recipe: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<String> uploadRecipePhoto(File file, String recipeName) async {
//     try {
//       TaskSnapshot snapshot = await _storage.ref('recipe_photos/$recipeName').putFile(file);
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to upload recipe photo: $e');
//       return '';
//     }
//   }

//   Future<void> pickRecipePhoto(String recipeName) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final file = File(pickedFile.path);

//       File? croppedFile = await _cropImage(file);
//       if (croppedFile == null) return;

//       String downloadUrl = await uploadRecipePhoto(croppedFile, recipeName);
//       if (downloadUrl.isNotEmpty) {
//         recipe.update((val) {
//           if (val != null) {
//             val.recipePhotoUrl = downloadUrl;
//           }
//         });
//       }
//     }
//   }

//   Future<File?> _cropImage(File file) async {
//     File? croppedFile = await ImageCropper().cropImage(
//       sourcePath: file.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       androidUiSettings: const AndroidUiSettings(
//         toolbarTitle: 'Crop Image',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false,
//       ),
//       iosUiSettings: const IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );
//     return croppedFile;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:myrecipe_app/user/controller.dart';
// import 'package:myrecipe_app/user/user.dart';
// import 'dart:io';
// import 'recipe_model.dart';

// class RecipeController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final UserController _userController = Get.put(UserController());

//   UserModel get user => _userController.user.value;

//   RxSet<String> wishlist = <String>{}.obs;

//   var isLoading = false.obs;
//   var recipe = RecipeModel(
//     recipeName: '',
//     recipePublisherName: '',
//     cookingTime: 0,
//     category: '',
//     recipeDiscription: '',
//     ingredients: [],
//     servingSize: '',
//     recipePhotoUrl: '',
//     numOfLike: 0,
//   ).obs;

//   var recipes = <RecipeModel>[].obs;
//   var searchQuery = ''.obs;
//   var selectedFilter = 'All'.obs;
//   var selectedSort = 'Name'.obs;
//   var ingredientControllers =
//       <TextEditingController>[TextEditingController()].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecipes();
//     fetchWishlist();
//   }

//   void fetchWishlist() {
//     getWishlist().listen((List<RecipeModel> wishlistRecipes) {
//       wishlist.clear();
//       wishlist.addAll(wishlistRecipes.map((recipe) => recipe.recipeName));
//     });
//   }

//   void toggleWishlistStatus(RecipeModel recipe) {
//     if (wishlist.contains(recipe.recipeName)) {
//       removeFromWishlist(recipe);
//     } else {
//       addToWishlist(recipe);
//     }
//   }

//   bool isInWishlist(RecipeModel recipe) {
//     return wishlist.contains(recipe.recipeName);
//   }

//   void fetchRecipes() {
//     _firestore.collection('recipes').snapshots().listen((snapshot) {
//       recipes.value =
//           snapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList();
//     });
//   }

//   List<RecipeModel> get filteredAndSortedRecipes {
//     List<RecipeModel> filteredRecipes = recipes.where((recipe) {
//       return recipe.recipeName
//               .toLowerCase()
//               .contains(searchQuery.value.toLowerCase()) &&
//           (selectedFilter.value == 'All' ||
//               recipe.category == selectedFilter.value);
//     }).toList();

//     if (selectedSort.value == 'Name') {
//       filteredRecipes.sort((a, b) => a.recipeName.compareTo(b.recipeName));
//     } else if (selectedSort.value == 'Publisher') {
//       filteredRecipes.sort(
//           (a, b) => a.recipePublisherName.compareTo(b.recipePublisherName));
//     }

//     return filteredRecipes;
//   }

//   void addIngredient() {
//     ingredientControllers.add(TextEditingController());
//   }

//   void removeIngredient(int index) {
//     if (ingredientControllers.length > 1) {
//       ingredientControllers.removeAt(index);
//     }
//   }

//   Future<void> updateRecipe(RecipeModel updatedRecipe) async {
//     isLoading.value = true;
//     try {
//       DocumentReference docRef =
//           _firestore.collection('recipes').doc(updatedRecipe.recipeName);
//       DocumentSnapshot docSnap = await docRef.get();

//       if (docSnap.exists) {
//         await docRef.update(updatedRecipe.toMap());
//       } else {
//         await docRef.set(updatedRecipe.toMap());
//       }
//     } catch (e) {
//       print('Error updating recipe: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> deleteRecipe(RecipeModel recipe) async {
//     try {
//       await _firestore.collection('recipes').doc(recipe.recipeName).delete();
//       Get.snackbar('Success', 'Recipe deleted successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to delete recipe: $e');
//     }
//   }

//   Future<void> publishRecipe() async {
//     if (recipe.value.recipePhotoUrl.isEmpty) {
//       Get.snackbar('Error', 'Please upload a recipe photo before publishing.');
//       return;
//     }

//     isLoading.value = true;
//     try {
//       recipe.update((val) {
//         if (val != null) {
//           val.ingredients = ingredientControllers
//               .map((controller) => controller.text)
//               .toList();
//         }
//       });
//       await _firestore
//           .collection('recipes')
//           .doc(recipe.value.recipeName)
//           .set(recipe.value.toMap());
//       Get.snackbar('Success', 'Recipe published successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to publish recipe: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<String> uploadRecipePhoto(File file, String recipeName) async {
//     try {
//       TaskSnapshot snapshot =
//           await _storage.ref('recipe_photos/$recipeName').putFile(file);
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to upload recipe photo: $e');
//       return '';
//     }
//   }

//   Future<void> pickRecipePhoto(String recipeName) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final file = File(pickedFile.path);

//       File? croppedFile = await _cropImage(file);
//       if (croppedFile == null) return;

//       String downloadUrl = await uploadRecipePhoto(croppedFile, recipeName);
//       if (downloadUrl.isNotEmpty) {
//         recipe.update((val) {
//           if (val != null) {
//             val.recipePhotoUrl = downloadUrl;
//           }
//         });
//       }
//     }
//   }

//   Future<File?> _cropImage(File file) async {
//     File? croppedFile = await ImageCropper().cropImage(
//       sourcePath: file.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       androidUiSettings: const AndroidUiSettings(
//         toolbarTitle: 'Crop Image',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false,
//       ),
//       iosUiSettings: const IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );
//     return croppedFile;
//   }

//   Future<void> addToWishlist(RecipeModel recipe) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(user.email)
//           .collection('wishlist')
//           .doc(recipe.recipeName)
//           .set(recipe.toMap());
//       Get.snackbar(
//         'Success',
//         '${recipe.recipeName.capitalize.toString()} added to wishlist',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.green,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to add ${recipe.recipeName.capitalize.toString()} to wishlist: $e',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.redAccent,
//       );
//       print(e.toString());
//     }
//   }

//   Future<void> removeFromWishlist(RecipeModel recipe) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(user.email)
//           .collection('wishlist')
//           .doc(recipe.recipeName)
//           .delete();
//       Get.snackbar(
//         'Success',
//         '${recipe.recipeName.capitalize.toString()} removed from wishlist',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.redAccent,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to remove ${recipe.recipeName.capitalize.toString()} from wishlist: $e',
//         duration: const Duration(seconds: 1),
//       );
//     }
//   }

//   Stream<List<RecipeModel>> getWishlist() {
//     return _firestore
//         .collection('users')
//         .doc(user.email)
//         .collection('wishlist')
//         .snapshots()
//         .map((snapshot) =>
//             snapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList());
//   }

//   Future<bool> isRecipeInWishlist(RecipeModel recipe) async {
//     DocumentSnapshot doc = await _firestore
//         .collection('users')
//         .doc(user.email)
//         .collection('wishlist')
//         .doc(recipe.recipeName)
//         .get();
//     return doc.exists;
//   }
// }









// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:myrecipe_app/user/controller.dart';
// import 'package:myrecipe_app/user/user.dart';
// import 'dart:io';
// import 'recipe_model.dart';

// class RecipeController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final UserController _userController = Get.put(UserController());

//   UserModel get user => _userController.user.value;

//   RxSet<String> wishlist = <String>{}.obs;

//   var isLoading = false.obs;
//   var recipe = RecipeModel(
//     recipeName: '',
//     recipePublisherName: '',
//     cookingTime: 0,
//     category: '',
//     recipeDiscription: '',
//     ingredients: [],
//     servingSize: '',
//     recipePhotoUrl: '',
//     numOfLike: 0,
//   ).obs;

//   var recipes = <RecipeModel>[].obs;
//   var searchQuery = ''.obs;
//   var selectedFilter = 'All'.obs;
//   var selectedSort = 'Name'.obs;
//   var ingredientControllers =
//       <TextEditingController>[TextEditingController()].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRecipes();
//     fetchWishlist();
//   }

//   void fetchWishlist() {
//     getWishlist().listen((List<RecipeModel> wishlistRecipes) {
//       wishlist.clear();
//       wishlist.addAll(wishlistRecipes.map((recipe) => recipe.recipeName));
//     });
//   }

//   void toggleWishlistStatus(RecipeModel recipe) {
//     if (wishlist.contains(recipe.recipeName)) {
//       removeFromWishlist(recipe);
//     } else {
//       addToWishlist(recipe);
//     }
//   }

//   bool isInWishlist(RecipeModel recipe) {
//     return wishlist.contains(recipe.recipeName);
//   }

//   void fetchRecipes() {
//     _firestore.collection('recipes').snapshots().listen((snapshot) {
//       recipes.value =
//           snapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList();
//     });
//   }

//   List<RecipeModel> get filteredAndSortedRecipes {
//     List<RecipeModel> filteredRecipes = recipes.where((recipe) {
//       return recipe.recipeName
//               .toLowerCase()
//               .contains(searchQuery.value.toLowerCase()) &&
//           (selectedFilter.value == 'All' ||
//               recipe.category == selectedFilter.value);
//     }).toList();

//     if (selectedSort.value == 'Name') {
//       filteredRecipes.sort((a, b) => a.recipeName.compareTo(b.recipeName));
//     } else if (selectedSort.value == 'Publisher') {
//       filteredRecipes.sort(
//           (a, b) => a.recipePublisherName.compareTo(b.recipePublisherName));
//     }

//     return filteredRecipes;
//   }

//   void addIngredient() {
//     ingredientControllers.add(TextEditingController());
//   }

//   void removeIngredient(int index) {
//     if (ingredientControllers.length > 1) {
//       ingredientControllers.removeAt(index);
//     }
//   }

//   Future<void> updateRecipe(RecipeModel updatedRecipe) async {
//     isLoading.value = true;
//     try {
//       DocumentReference docRef =
//           _firestore.collection('recipes').doc(updatedRecipe.recipeName);
//       DocumentSnapshot docSnap = await docRef.get();

//       if (docSnap.exists) {
//         await docRef.update(updatedRecipe.toMap());
//       } else {
//         await docRef.set(updatedRecipe.toMap());
//       }
//     } catch (e) {
//       print('Error updating recipe: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> deleteRecipe(RecipeModel recipe) async {
//     try {
//       await _firestore.collection('recipes').doc(recipe.recipeName).delete();
//       Get.snackbar('Success', 'Recipe deleted successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to delete recipe: $e');
//     }
//   }

//   Future<void> publishRecipe() async {
//     if (recipe.value.recipePhotoUrl.isEmpty) {
//       Get.snackbar('Error', 'Please upload a recipe photo before publishing.');
//       return;
//     }

//     isLoading.value = true;
//     try {
//       recipe.update((val) {
//         if (val != null) {
//           val.ingredients = ingredientControllers
//               .map((controller) => controller.text)
//               .toList();
//         }
//       });
//       await _firestore
//           .collection('recipes')
//           .doc(recipe.value.recipeName)
//           .set(recipe.value.toMap());
//       Get.snackbar('Success', 'Recipe published successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to publish recipe: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<String> uploadRecipePhoto(File file, String recipeName) async {
//     try {
//       TaskSnapshot snapshot =
//           await _storage.ref('recipe_photos/$recipeName').putFile(file);
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to upload recipe photo: $e');
//       return '';
//     }
//   }

//   Future<void> updateRecipePhoto(String recipeName) async {
//     final picker = ImagePicker();

//     try {
//       // Fetch the existing recipe document
//       DocumentSnapshot recipeSnapshot = await _firestore.collection('recipes').doc(recipeName).get();

//       if (!recipeSnapshot.exists) {
//         Get.snackbar('Error', 'Recipe not found.');
//         return;
//       }

//       Map<String, dynamic> data = recipeSnapshot.data() as Map<String, dynamic>;

//       // Check if an existing photo URL is available
//       if (data.containsKey('recipePhotoUrl') && data['recipePhotoUrl'].isNotEmpty) {
//         String existingPhotoUrl = data['recipePhotoUrl'];
//         print('Existing photo URL: $existingPhotoUrl');
//       }

//       // Pick a new photo
//       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile == null) {
//         Get.snackbar('Error', 'No image selected.');
//         return;
//       }

//       final file = File(pickedFile.path);

//       // Crop the image
//       File? croppedFile = await _cropImage(file);
//       if (croppedFile == null) {
//         Get.snackbar('Error', 'Image cropping failed.');
//         return;
//       }

//       // Upload the new photo
//       String downloadUrl = await uploadRecipePhoto(croppedFile, recipeName);
//       if (downloadUrl.isEmpty) {
//         Get.snackbar('Error', 'Failed to upload recipe photo.');
//         return;
//       }

//       // Update the Firestore document with the new photo URL
//       await _firestore.collection('recipes').doc(recipeName).update({'recipePhotoUrl': downloadUrl});

//       // Update the local recipe model
//       recipe.update((val) {
//         if (val != null) {
//           val.recipePhotoUrl = downloadUrl;
//         }
//       });

//       Get.snackbar('Success', 'Recipe photo updated successfully.');

//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//       print('Error updating recipe photo: $e');
//     }
//   }

//   Future<File?> _cropImage(File file) async {
//     File? croppedFile = await ImageCropper().cropImage(
//       sourcePath: file.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       androidUiSettings: const AndroidUiSettings(
//         toolbarTitle: 'Crop Image',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false,
//       ),
//       iosUiSettings: const IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );
//     return croppedFile;
//   }

//   Future<void> addToWishlist(RecipeModel recipe) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(user.email)
//           .collection('wishlist')
//           .doc(recipe.recipeName)
//           .set(recipe.toMap());
//       Get.snackbar(
//         'Success',
//         '${recipe.recipeName.capitalize.toString()} added to wishlist',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.green,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to add ${recipe.recipeName.capitalize.toString()} to wishlist: $e',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.redAccent,
//       );
//       print(e.toString());
//     }
//   }

//   Future<void> removeFromWishlist(RecipeModel recipe) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(user.email)
//           .collection('wishlist')
//           .doc(recipe.recipeName)
//           .delete();
//       Get.snackbar(
//         'Success',
//         '${recipe.recipeName.capitalize.toString()} removed from wishlist',
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         colorText: Colors.redAccent,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to remove ${recipe.recipeName.capitalize.toString()} from wishlist: $e',
//         duration: const Duration(seconds: 1),
//       );
//     }
//   }

//   Stream<List<RecipeModel>> getWishlist() {
//     return _firestore
//         .collection('users')
//         .doc(user.email)
//         .collection('wishlist')
//         .snapshots()
//         .map((snapshot) =>
//             snapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList());
//   }

//   Future<bool> isRecipeInWishlist(RecipeModel recipe) async {
//     DocumentSnapshot doc = await _firestore
//         .collection('users')
//         .doc(user.email)
//         .collection('wishlist')
//         .doc(recipe.recipeName)
//         .get();
//     return doc.exists;
//   }
// }








import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myrecipe_app/user/controller.dart';
import 'package:myrecipe_app/user/user.dart';
import 'dart:io';
import 'recipe_model.dart';

class RecipeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final UserController _userController = Get.put(UserController());

  UserModel get user => _userController.user.value;

  RxSet<String> wishlist = <String>{}.obs;

  var isLoading = false.obs;
  var recipe = RecipeModel(
    recipeName: '',
    recipePublisherName: '',
    cookingTime: 0,
    category: '',
    recipeDiscription: '',
    ingredients: [],
    servingSize: '',
    recipePhotoUrl: '',
    numOfLike: 0,
  ).obs;

  var recipes = <RecipeModel>[].obs;
  var searchQuery = ''.obs;
  var selectedFilter = 'All'.obs;
  var selectedSort = 'Name'.obs;
  var ingredientControllers =
      <TextEditingController>[TextEditingController()].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
    fetchWishlist();
  }

  void fetchWishlist() {
    getWishlist().listen((List<RecipeModel> wishlistRecipes) {
      wishlist.clear();
      wishlist.addAll(wishlistRecipes.map((recipe) => recipe.recipeName));
    });
  }

  void toggleWishlistStatus(RecipeModel recipe) {
    if (wishlist.contains(recipe.recipeName)) {
      removeFromWishlist(recipe);
    } else {
      addToWishlist(recipe);
    }
  }

  bool isInWishlist(RecipeModel recipe) {
    return wishlist.contains(recipe.recipeName);
  }

  void fetchRecipes() {
    _firestore.collection('recipes').snapshots().listen((snapshot) {
      recipes.value =
          snapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList();
    });
  }

  List<RecipeModel> get filteredAndSortedRecipes {
    List<RecipeModel> filteredRecipes = recipes.where((recipe) {
      return recipe.recipeName
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()) &&
          (selectedFilter.value == 'All' ||
              recipe.category == selectedFilter.value);
    }).toList();

    if (selectedSort.value == 'Name') {
      filteredRecipes.sort((a, b) => a.recipeName.compareTo(b.recipeName));
    } else if (selectedSort.value == 'Publisher') {
      filteredRecipes.sort(
          (a, b) => a.recipePublisherName.compareTo(b.recipePublisherName));
    }

    return filteredRecipes;
  }

  void addIngredient() {
    ingredientControllers.add(TextEditingController());
  }

  void removeIngredient(int index) {
    if (ingredientControllers.length > 1) {
      ingredientControllers.removeAt(index);
    }
  }

  Future<void> updateRecipe(RecipeModel updatedRecipe) async {
    isLoading.value = true;
    try {
      DocumentReference docRef =
          _firestore.collection('recipes').doc(updatedRecipe.recipeName);
      DocumentSnapshot docSnap = await docRef.get();

      if (docSnap.exists) {
        await docRef.update(updatedRecipe.toMap());
      } else {
        await docRef.set(updatedRecipe.toMap());
      }
    } catch (e) {
      print('Error updating recipe: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteRecipe(RecipeModel recipe) async {
    try {
      await _firestore.collection('recipes').doc(recipe.recipeName).delete();
      Get.snackbar('Success', 'Recipe deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete recipe: $e');
    }
  }

  Future<void> publishRecipe() async {
    if (recipe.value.recipePhotoUrl.isEmpty) {
      Get.snackbar('Error', 'Please upload a recipe photo before publishing.');
      return;
    }

    isLoading.value = true;
    try {
      recipe.update((val) {
        if (val != null) {
          val.ingredients = ingredientControllers
              .map((controller) => controller.text)
              .toList();
        }
      });
      await _firestore
          .collection('recipes')
          .doc(recipe.value.recipeName)
          .set(recipe.value.toMap());
      Get.snackbar('Success', 'Recipe published successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to publish recipe: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> uploadRecipePhoto(File file, String recipeName) async {
    try {
      TaskSnapshot snapshot =
          await _storage.ref('recipe_photos/$recipeName').putFile(file);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload recipe photo: $e');
      return '';
    }
  }

  Future<void> updateRecipePhoto(String recipeName) async {
    final picker = ImagePicker();

    try {
      // Ensure the recipeName is not empty
      if (recipeName.isEmpty) {
        Get.snackbar('Error', 'Recipe name cannot be empty.');
        return;
      }

      // Fetch the existing recipe document
      DocumentReference recipeRef = _firestore.collection('recipes').doc(recipeName);
      DocumentSnapshot recipeSnapshot = await recipeRef.get();

      // If the recipe does not exist, create it with default values
      if (!recipeSnapshot.exists) {
        await recipeRef.set({
          'recipeName': recipeName,
          'recipePublisherName': user.email, // Assuming user email as publisher name
          'cookingTime': 0,
          'category': '',
          'recipeDiscription': '',
          'ingredients': [],
          'servingSize': '',
          'recipePhotoUrl': '',
          'numOfLike': 0,
        });
      }

      // Pick a new photo
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        Get.snackbar('Error', 'No image selected.');
        return;
      }

      final file = File(pickedFile.path);

      // Crop the image
      File? croppedFile = await _cropImage(file);
      if (croppedFile == null) {
        Get.snackbar('Error', 'Image cropping failed.');
        return;
      }

      // Upload the new photo
      String downloadUrl = await uploadRecipePhoto(croppedFile, recipeName);
      if (downloadUrl.isEmpty) {
        Get.snackbar('Error', 'Failed to upload recipe photo.');
        return;
      }

      // Update the Firestore document with the new photo URL
      await recipeRef.update({'recipePhotoUrl': downloadUrl});

      // Update the local recipe model
      recipe.update((val) {
        if (val != null) {
          val.recipePhotoUrl = downloadUrl;
        }
      });

      Get.snackbar('Success', 'Recipe photo updated successfully.');

    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print('Error updating recipe photo: $e');
    }
  }

  Future<File?> _cropImage(File file) async {
    File? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );
    return croppedFile;
  }

  Future<void> addToWishlist(RecipeModel recipe) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.email)
          .collection('wishlist')
          .doc(recipe.recipeName)
          .set(recipe.toMap());
      Get.snackbar(
        'Success',
        '${recipe.recipeName.capitalize.toString()} added to wishlist',
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add ${recipe.recipeName.capitalize.toString()} to wishlist: $e',
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.redAccent,
      );
      print(e.toString());
    }
  }

  Future<void> removeFromWishlist(RecipeModel recipe) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.email)
          .collection('wishlist')
          .doc(recipe.recipeName)
          .delete();
      Get.snackbar(
        'Removed',
        '${recipe.recipeName.capitalize.toString()} removed from wishlist',
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to remove ${recipe.recipeName.capitalize.toString()} from wishlist: $e',
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.redAccent,
      );
      print(e.toString());
    }
  }

  Stream<List<RecipeModel>> getWishlist() {
    return _firestore
        .collection('users')
        .doc(user.email)
        .collection('wishlist')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => RecipeModel.fromDocument(doc))
          .toList();
    });
  }
}
