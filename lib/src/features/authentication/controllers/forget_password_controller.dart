import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_mail/reset_passwrd_screen.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:talkify_chat_application/src/utils/constants/images_strings.dart';
import 'package:talkify_chat_application/src/utils/helpers/network_manager.dart';
import 'package:talkify_chat_application/src/utils/popups/full_screen_loader.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send reset password emails

  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();

      Tloaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
      Get.to(() => ResetEmailPasswordScreen(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }


      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Tloaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
