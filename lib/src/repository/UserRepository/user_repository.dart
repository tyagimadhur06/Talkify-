import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';

import '../../utils/exceptitons/firebase_exceptions.dart';
import '../../utils/exceptitons/format_exceptions.dart';
import '../../utils/exceptitons/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again.';
    }
  }

  ///Fetch all users or user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  Future<List<UserModel>> allUser(String email) async {
    final snapshot = await _db.collection("Users").get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    return userData;
  }
  Future<bool> doesUserRecordExist(String userId) async {
    try {
      // Check if a user record with the given user ID exists
      DocumentSnapshot userSnapshot =
          await _db.collection('users').doc(userId).get();

      // Return true if the record exists, false otherwise
      return userSnapshot.exists;
    } catch (e) {
      // Handle exceptions, e.g., log the error
      print('Error checking user record: $e');
      return false;
    }
  }

  Future<UserModel?> getUserById(String userId) async {
    try {
      final snapshot = await _db.collection("Users").doc(userId).get();

      if (snapshot.exists) {
        return UserModel.fromSnapshot(snapshot);
      } else {
        return null; // User not found
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

}
