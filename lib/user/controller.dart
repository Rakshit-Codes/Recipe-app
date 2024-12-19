// // // import 'package:get/get.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:recipe_app/user/user.dart';
// // // // Adjust import path as per your project structure

// // // class RUserController extends GetxController {
// // //   final FirebaseFirestore _db = FirebaseFirestore.instance;
// // //   final RxList<RUser> ruser = <RUser>[].obs;

// // //   @override
// // //   void onInit() {
// // //     // Fetch initial list of products when controller is initialized
// // //     fetchRUser();
// // //     super.onInit();
// // //   }

// // //   // Fetch all products from Firestore
// // //   void fetchRUser() async {
// // //     try {
// // //       final QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection('ruser').get();
// // //       ruser.value = snapshot.docs.map((doc) => RUser.fromFirestore(doc)).toList();
// // //     } catch (e) {
// // //       print('Error fetching ruser: $e');
// // //     }
// // //   }

// // //   // Add a new product to Firestore
// // //   void addProduct(RUser ruser) async {
// // //     try {
// // //       await _db.collection('ruser').add(ruser.toMap());
// // //       fetchRUser(); // Refresh the list after adding
// // //     } catch (e) {
// // //       print('Error adding user: $e');
// // //     }
// // //   }

// // //   // Update an existing product in Firestore
// // //   void updateProduct(RUser updateruser) async {
// // //     try {
// // //       await _db.collection('ruser').doc(updateruser.id).update(updateruser.toMap());
// // //       fetchRUser(); // Refresh the list after updating
// // //     } catch (e) {
// // //       print('Error updating user: $e');
// // //     }
// // //   }

// // //   // Delete a product from Firestore
// // //   void deleteProduct(String ruser) async {
// // //     try {
// // //       await _db.collection('ruser').doc(ruser).delete();
// // //       fetchRUser(); // Refresh the list after deleting
// // //     } catch (e) {
// // //       print('Error deleting user: $e');
// // //     }
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:get/get.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // import 'package:recipe_app/user/user.dart';


// // class RUserController extends GetxController {
// //   final FirebaseFirestore _db = FirebaseFirestore.instance;
// //   final FirebaseStorage _storage = FirebaseStorage.instance;
// //   final RxList<RUser> ruser = <RUser>[].obs;
// //   var currentUser = Rxn<RUser>();

// //   @override
// //   void onInit() {
// //     // Fetch initial list of products when the controller is initialized
// //     fetchRUser();
// //     super.onInit();
// //   }

// //   // Fetch all products from Firestore
// //   void fetchRUser() async {
// //     try {
// //       final QuerySnapshot<Map<String, dynamic>> snapshot =
// //           await _db.collection('ruser').get();
// //       ruser.value =
// //           snapshot.docs.map((doc) => RUser.fromFirestore(doc)).toList();
// //     } catch (e) {
// //       print('Error fetching ruser: $e');
// //     }
// //   }

// //   // Fetch a single user from Firestore
// //   Future<void> fetchUser(String userId) async {
// //     try {
// //       final DocumentSnapshot<Map<String, dynamic>> doc =
// //           await _db.collection('ruser').doc(userId).get();
// //       if (doc.exists) {
// //         currentUser.value = RUser.fromFirestore(doc);
// //       }
// //     } catch (e) {
// //       print('Error fetching user: $e');
// //     }
// //   }

// //   // Add a new product to Firestore
// //   Future<void> addProduct(RUser ruser) async {
// //     try {
// //       await _db.collection('ruser').add(ruser.toMap());
// //       fetchRUser(); // Refresh the list after adding
// //     } catch (e) {
// //       print('Error adding user: $e');
// //     }
// //   }

// //   // Update an existing product in Firestore
// //   Future<void> updateProduct(RUser updateruser) async {
// //     try {
// //       await _db
// //           .collection('ruser')
// //           .doc(updateruser.id)
// //           .update(updateruser.toMap());
// //       fetchRUser(); // Refresh the list after updating
// //     } catch (e) {
// //       print('Error updating user: $e');
// //     }
// //   }

// //   // Delete a product from Firestore
// //   Future<void> deleteProduct(String ruserId) async {
// //     try {
// //       await _db.collection('ruser').doc(ruserId).delete();
// //       fetchRUser(); // Refresh the list after deleting
// //     } catch (e) {
// //       print('Error deleting user: $e');
// //     }
// //   }

// //   // Update user photo in Firestore
// //   Future<void> updateUserPhoto(File photo) async {
// //     if (currentUser.value != null) {
// //       try {
// //         String fileName = '${currentUser.value!.id}_profile.jpg';
// //         TaskSnapshot snapshot =
// //             await _storage.ref().child('user_photos/$fileName').putFile(photo);
// //         String downloadUrl = await snapshot.ref.getDownloadURL();

// //         currentUser.value!.mainImage = File(downloadUrl);
// //         updateProduct(currentUser.value!);
// //       } catch (e) {
// //         print('Error uploading photo: $e');
// //       }
// //     }
// //   }
// // }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:recipe_app/user/user.dart';


// class UserController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   var user = UserModel(
//     email: '',
//     name: '',
//     phoneNumber: '',
//     profilePhotoUrl: '',
//     accountType: '',
//   ).obs;
//   var isLoading = false.obs;
//   var isFormFilled = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       user.update((val) {
//         if (val != null) {
//           val.email = currentUser.email ?? '';
//         }
//       });
//       fetchUserData(currentUser.email ?? '');
//     }
//   }

//   Future<void> fetchUserData(String email) async {
//     isLoading.value = true;
//     try {
//       DocumentSnapshot doc = await _firestore.collection('users').doc(email).get();
//       if (doc.exists) {
//         user.value = UserModel.fromDocument(doc);
//         isFormFilled.value = true;
//       } else {
//         isFormFilled.value = false;
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to fetch user information');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> saveUser(UserModel userModel) async {
//     try {
//       await _firestore.collection('users').doc(userModel.email).set(userModel.toMap());
//       Get.snackbar('Success', 'User information saved successfully');
//       isFormFilled.value = true;
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to save user information');
//     }
//   }

//   Future<String> uploadProfilePhoto(File file, String email) async {
//     try {
//       TaskSnapshot snapshot = await _storage.ref('profile_photos/$email').putFile(file);
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to upload profile photo');
//       return '';
//     }
//   }

//   Future<void> pickProfilePhoto(String email) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final file = File(pickedFile.path);

//       File? croppedFile = await _cropImage(file);
//       if(croppedFile == null) return;

//       // Check file size
//       final fileSize = await croppedFile.length();
//       if (fileSize > 500 * 1024) {
//         Get.snackbar('Error', 'Profile photo must be less than 500KB');
//         return;
//       }

//       String downloadUrl = await uploadProfilePhoto(croppedFile, email);
//       user.update((user) {
//         if (user != null) {
//           user.profilePhotoUrl = downloadUrl;
//         }
//       });
//     }
//   }
// }

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




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myrecipe_app/user/user.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var user = UserModel(
    email: '',
    fname: '',
    lname: '',
    phoneNumber: '',
    profilePhotoUrl: '',
    accountType: '',
  ).obs;
  var isLoading = false.obs;
  var isFormFilled = false.obs;
  // String userId = '';
  // ////
  //   void fetchUser() async {
  //   try {
  //     DocumentSnapshot doc = await _firestore.collection('users').doc('YOUR_USER_ID').get();
  //     if (doc.exists) {
  //       user.value = UserModel.fromDocument(doc);
  //       userId = doc.id;
  //     }
  //   } catch (e) {
  //     print('Error fetching user: $e');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    final currentUser = FirebaseAuth.instance.currentUser;
    // fetchUser();
    if (currentUser != null) {
      user.update((val) {
        if (val != null) {
          val.email = currentUser.email ?? '';
        }
      });
      fetchUserData(currentUser.email ?? '');
    }
  }

  Future<void> fetchUserData(String email) async {
    isLoading.value = true;
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(email).get();
      if (doc.exists) {
        user.value = UserModel.fromDocument(doc);
        isFormFilled.value = true;
      } else {
        isFormFilled.value = false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user information');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUser(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc(userModel.email).set(userModel.toMap());
      Get.snackbar('Success', 'User information saved successfully');
      isFormFilled.value = true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to save user information');
    }
  }

  Future<String> uploadProfilePhoto(File file, String email) async {
    try {
      TaskSnapshot snapshot = await _storage.ref('profile_photos/$email').putFile(file);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload profile photo');
      return '';
    }
  }

  Future<void> pickProfilePhoto(String email) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);

      File? croppedFile = await _cropImage(file);
      if(croppedFile == null) return;

      // Check file size
      final fileSize = await croppedFile.length();
      if (fileSize > 500 * 1024) {
        Get.snackbar('Error', 'Profile photo must be less than 500KB');
        return;
      }

      String downloadUrl = await uploadProfilePhoto(croppedFile, email);
      user.update((user) {
        if (user != null) {
          user.profilePhotoUrl = downloadUrl;
        }
      });
    }
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