import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/login_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/profile_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/re_authenticate_screen.dart';
import 'package:talkify_chat_application/src/features/personalization/controllers/user_controller.dart';
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:talkify_chat_application/src/utils/constants/images_strings.dart';
import 'package:talkify_chat_application/src/utils/helpers/network_manager.dart';
import 'package:talkify_chat_application/src/utils/popups/full_screen_loader.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final userController = Get.put(UserController());
  final userRepository = Get.put(UserRepository());

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialzeNames();
    super.onInit();
  }

  Future<void> initialzeNames() async {
    fullName.text = userController.user.value.fullName;
    email.text = userController.user.value.email;
    phoneNo.text = userController.user.value.phoneNo;
  }

  Future<void> updateUserData() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);
      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateProfileFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FullName': fullName.text.trim(),
        'Email': email.text.trim(),
        'Phone': phoneNo.text.trim(),
      };
      await userRepository.updateSingleField(name);

      userController.user.value.fullname = fullName.text.trim();
      userController.user.value.email = email.text.trim();
      userController.user.value.phoneNo = phoneNo.text.trim();
      FullScreenLoader.stopLoading();

      Tloaders.successSnackBar(
          title: 'Congratulations', message: 'Your profile has been updated');
      Get.off(() => ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(5.0),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account? After you have deleted an account, it will be permanently deleted. Accounts cannot be recovered.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      //re_authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteUserAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        } else if (provider == 'phone') {
          FullScreenLoader.stopLoading();
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailandPassword() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing..', TImages.docerAnimation);

      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailandPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteUserAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  
}
