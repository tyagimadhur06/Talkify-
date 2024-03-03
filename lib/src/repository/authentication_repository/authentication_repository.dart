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
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
import 'package:talkify_chat_application/src/utils/exceptitons/format_exceptions.dart';
import 'package:talkify_chat_application/src/utils/exceptitons/platform_exception.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

import '../../utils/exceptitons/firebase_auth_exceptions.dart';
import '../../utils/exceptitons/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // FirebaseAuth get auth => _auth;
  final userRepo = Get.put(UserRepository());
  //variables
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final deviceStorage = GetStorage();
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => HomeScreen());
      } else if (user.phoneNumber != null) {
        // User authenticated with phone number
        // Redirect to the appropriate screen (e.g., HomeScreen for phone authentication)
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

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 60),
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Tloaders.errorSnackBar(title: e);
          } else if (e.code == 'user-not-found') {
            Tloaders.errorSnackBar(
                title: 'User Not Found', message: 'Account has been deleted.');
          } else {
            Tloaders.errorSnackBar(title: 'Error', message: e.toString());
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          Tloaders.successSnackBar(
              title: 'OTP Sent!', message: 'OTP Sent to the entered number.');
        },
        codeAutoRetrievalTimeout: ((verificationId) {
          this.verificationId.value = verificationId;
        }),
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('Error during phone authentication: $e');
      throw 'Something went wrong.Please try again.';
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      // Sign in with the provided OTP
      var credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verificationId.value, smsCode: otp));

      // Check if the user is successfully signed in
      return credentials.user != null;
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException (if needed)
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      // Handle FirebaseException (if needed)
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      // Handle FormatException (if needed)
      throw const TFormatException();
    } on PlatformException catch (e) {
      // Handle PlatformException (if needed)
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions (if needed)
      throw 'Something went wrong. Please try again.';
    }
  }

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

  //forget-password -> using email verification
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  Future<void> reAuthenticateWithEmailandPassword(
      String email, String Password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: Password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

  Future<void> deleteUserAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();      
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
