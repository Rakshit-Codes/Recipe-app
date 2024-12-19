import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistModel {
  String userId;
  String recipeId;

  WishlistModel({
    required this.userId,
    required this.recipeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'recipeId': recipeId,
    };
  }

  factory WishlistModel.fromDocument(DocumentSnapshot doc) {
    return WishlistModel(
      userId: doc['userId'],
      recipeId: doc['recipeId'],
    );
  }
}