import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/home_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/login_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Signup/verify_email_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:talkify_chat_application/src/utils/exceptitons/format_exceptions.dart';
import 'package:talkify_chat_application/src/utils/exceptitons/platform_exception.dart';

import '../../utils/exceptitons/firebase_auth_exceptions.dart';
import '../../utils/exceptitons/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    // firebaseUser = Rx<User?>(_auth.currentUser);
    // firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  // _setInitialScreen(User? user) {
  //   user == null
  //       ? Get.offAll(() => const LoginScreen())
  //       : Get.offAll(() => HomeScreen());
  // }

  // Future<void> phoneAuthentication(String phoneNo) async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNo,
  //       verificationCompleted: (credential) async {
  //         await _auth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (e) {
  //         if (e.code == 'invalid-phone-number') {
  //           Get.snackbar('Error', 'The Provided phone number is not valid.');
  //         } else {
  //           Get.snackbar('Error', 'Something went wrong.Try Again.');
  //         }
  //       },
  //       codeSent: (verificationId, resendToken) {
  //         this.verificationId.value = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: ((verificationId) {
  //         this.verificationId.value = verificationId;
  //       }));
  // }

  // Future<bool> verifyOTP(String otp) async {
  //   var credentials = await _auth.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //           verificationId: this.verificationId.value, smsCode: otp));

  //   return credentials.user != null ? true : false;
  // }
//->Login with eamail and password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

// -> Registeing with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

//-> Email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  //-> O-Auth : Google sign in
  Future<UserCredential> signInWithGoogle() async {
    try {
      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtaining the authenticatoin details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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
  // Future<void> loginUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //   } catch (_) {}
  // }

  //logout User
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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
}
