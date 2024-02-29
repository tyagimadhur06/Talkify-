import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Signup/verify_email_screen.dart';
import 'package:talkify_chat_application/src/utils/constants/images_strings.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:talkify_chat_application/src/utils/helpers/network_manager.dart';
import 'package:talkify_chat_application/src/utils/popups/full_screen_loader.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  //Textfield controllers to get the data from textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Future<void> createUser(UserModel user) async {
  //   await userRepo.createUser(user);
  //   phoneAuthentication(user.phoneNo);
  //   Get.to(() => const OtpScreen());
  // }



  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          TImages.docerAnimation);

      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        Tloaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account , you must have to accept the Privacy Policy & Terms of Use.');

        return;
      }

      //Register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          fullname: fullName.text.trim(),
          email: email.text.trim(),
          phoneNo: phoneNo.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove loader
      FullScreenLoader.stopLoading();

      //success message
      Tloaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      //moving to verify email screen
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
