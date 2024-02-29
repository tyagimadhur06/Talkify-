import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/profile_screen.dart';
import 'package:talkify_chat_application/src/features/personalization/controllers/user_controller.dart';
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
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

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialzeNames();
    super.onInit();
  }

  Future<void> initialzeNames() async {
    fullName.text = userController.user.value.fullName;
    email.text = userController.user.value.email;
    phoneNo.text = userController.user.value.email;
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
}
