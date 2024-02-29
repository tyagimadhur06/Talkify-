// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talkify_chat_application/src/utils/helpers/formatter.dart';

class UserModel {
  String? id;
  String fullname;
  final String email;
  String phoneNo;
  String profilePicture;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phoneNo,
    required this.profilePicture,
  });

  String get fullName => '$fullname';
  //helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNo);

  //static function to split fullname into first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //static function to generate username from the full name
  static String generateuUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$lastName$firstName";
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

  //static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '', fullname: '', email: '', phoneNo: '', profilePicture: '');

  //Converting model to JSON for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FullName': fullname,
      'Email': email,
      'Phone': phoneNo,
      'ProfilePicture': profilePicture
    };
  }
  // <--  fetch data from the cloud firestore --->
  //step 1 : Map user fetched from Firebase to UserModel

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullname: data["FullName"] ?? '',
      email: data["Email"] ?? '',
      phoneNo: data["Phone"] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  }
}
