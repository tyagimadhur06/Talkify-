import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/features/personalization/controllers/user_controller.dart';
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
import 'package:talkify_chat_application/src/utils/constants/images_strings.dart';
import 'package:talkify_chat_application/src/utils/helpers/network_manager.dart';
import 'package:talkify_chat_application/src/utils/popups/full_screen_loader.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  //variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  //final authRepo = Get.put(AuthenticationRepository());
  final userRepo = Get.put(UserRepository());
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  //email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging You In...', TImages.docerAnimation);

      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove loader
      FullScreenLoader.stopLoading();
      //success message
      Tloaders.successSnackBar(
          title: 'Welcome Back!',
          message: 'Successfully loged in! Enjoy your chatting experience.');
      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Google authentication and sign in
  Future<void> googleSignIn() async {
    try {
      //loading
      FullScreenLoader.openLoadingDialog(
          'Logging You In...', TImages.docerAnimation);

      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //stop loader
      FullScreenLoader.stopLoading();

      //success message
      Tloaders.successSnackBar(
          title: 'Welcome Back!',
          message: 'Successfully logged in! Enjoy your chatting experience.');

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> createUserPhoneAuth(UserModel user) async {
    try {
      // Initiate phone authentication
      FullScreenLoader.openLoadingDialog(
      'Logging You In...', TImages.docerAnimation);
       await PhoneAuthentication(user.phoneNo);
       // Add a delay before stopping the loading dialog
      await Future.delayed(const Duration(seconds: 4));
      FullScreenLoader.stopLoading();
      // Navigate to OTP screen
      Get.put(user);
      Get.to(() => OtpScreen(phoneNo: user.phoneNo,));
    } catch (e) {
      // Handle exceptions during phone authentication
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> PhoneAuthentication(String phoneNo) async {
    await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  // Future<void> phoneSignIn(String phoneNo) async {
  //   try {
  //     // loading
  //     FullScreenLoader.openLoadingDialog('Logging You In...', TImages.docerAnimation);

  //     // check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();

  //     if (!isConnected) {
  //       FullScreenLoader.stopLoading();
  //       return;
  //     }

  //     // Phone number authentication
  //     await AuthenticationRepository.instance.phoneAuthentication(phoneNo);

  //     // stop loader
  //     FullScreenLoader.stopLoading();

  //     // navigate to OTP verification screen
  //     //Get.to(() => (phoneNo: phoneNo.text.trim()));
  //   } catch (e) {
  //     FullScreenLoader.stopLoading();
  //     Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }
}
