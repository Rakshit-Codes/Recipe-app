// // // import 'dart:io';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class RUser {
// // //   final String id;
// // //   final String? user_Name;
// // //   final bool? isPublisher;
// // //   final bool? isVerified;
// // //   final String email;
// // //   final String? following;
// // //   final String? follower;
// // //   final String? phone_Number;
// // //   final File? mainImage; // Store main image as File
// // // // Store videos as Files

// // //   RUser({
// // //     required this.id,
// // //     this.isVerified,
// // //     this.user_Name,
// // //     this.following,
// // //     this.follower,
// // //     this.isPublisher,
// // //     required this.email,
// // //     this.phone_Number,
// // //     this.mainImage,
// // //   }) : assert(mainImage != null || user_Name != null,
// // //             'At least one image or extra image must be provided');

// // //   factory RUser.fromFirestore(DocumentSnapshot doc) {
// // //     final data = doc.data() as Map<String, dynamic>;
// // //     return RUser(
// // //       id: doc.id,
// // //       user_Name: data['user_Name'],
// // //       following: data['following'] ?? 0,
// // //       follower: data['follower'] ?? 0,
// // //       isVerified: data['isAvailable'] ?? false,
// // //       isPublisher: data['isAvailable'] ?? false,
// // //       mainImage: File(data['mainImage']),
// // //       email: data['email'],
// // //       phone_Number: data['phone_Number'],
// // //     );
// // //   }

// // //   Map<String, dynamic> toMap() {
// // //     return {
// // //       'user_Name': user_Name,
// // //       'following': following,
// // //       'follower': follower,
// // //       'email': email,
// // //       'phone_Number': phone_Number,
// // //       'isVerified': isVerified,
// // //       'isPublisher': isPublisher,
// // //       'mainImage': mainImage?.path, // Store file path as a string
// // //     };
// // //   }
// // // }

// // import 'dart:io';

// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class RUser {
// //   final String id;
// //   final String? user_Name;
// //   final bool? isPublisher;
// //   final bool? isVerified;
// //   final String email;
// //   final int? following; // Change to int
// //   final int? follower; // Change to int
// //   final String? phone_Number;
// //   late final File? mainImage;

// //   RUser({
// //     required this.id,
// //     this.isVerified,
// //     this.user_Name,
// //     this.following,
// //     this.follower,
// //     this.isPublisher,
// //     required this.email,
// //     this.phone_Number,
// //     this.mainImage,
// //   });

// //   factory RUser.fromFirestore(DocumentSnapshot doc) {
// //     final data = doc.data() as Map<String, dynamic>;
// //     return RUser(
// //       id: doc.id,
// //       user_Name: data['user_Name'],
// //       following: data['following'] ?? 0,
// //       follower: data['follower'] ?? 0,
// //       isVerified: data['isAvailable'] ?? false,
// //       isPublisher: data['isAvailable'] ?? false,
// //       mainImage: data['mainImage'] != null ? File(data['mainImage']) : null,
// //       email: data['email'],
// //       phone_Number: data['phone_Number'],
// //     );
// //   }

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'user_Name': user_Name,
// //       'following': following,
// //       'follower': follower,
// //       'email': email,
// //       'phone_Number': phone_Number,
// //       'isVerified': isVerified,
// //       'isPublisher': isPublisher,
// //       'mainImage': mainImage?.path,
// //     };
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   String email;
//   String name;
//   String phoneNumber;
//   String profilePhotoUrl;
//   String accountType;

//   UserModel({
//     required this.email,
//     required this.name,
//     required this.phoneNumber,
//     required this.profilePhotoUrl,
//     required this.accountType,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'email': email,
//       'name': name,
//       'phoneNumber': phoneNumber,
//       'profilePhotoUrl': profilePhotoUrl,
//       'accountType': accountType,
//     };
//   }

//   factory UserModel.fromDocument(DocumentSnapshot doc) {
//     return UserModel(
//       email: doc['email'],
//       name: doc['name'],
//       phoneNumber: doc['phoneNumber'],
//       profilePhotoUrl: doc['profilePhotoUrl'],
//       accountType: doc['accountType'],
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String fname;
  String lname;
  String phoneNumber;
  String profilePhotoUrl;
  String accountType;

  UserModel({
    required this.email,
    required this.fname,
    required this.lname,
    required this.phoneNumber,
    required this.profilePhotoUrl,
    required this.accountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fname': fname,
      'lname': lname,
      'phoneNumber': phoneNumber,
      'profilePhotoUrl': profilePhotoUrl,
      'accountType': accountType,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      email: doc['email'],
      fname: doc['fname'],
      lname: doc['lname'],
      phoneNumber: doc['phoneNumber'],
      profilePhotoUrl: doc['profilePhotoUrl'],
      accountType: doc['accountType'],
    );
  }
}
