import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/home_screen.dart';
import 'package:talkify_chat_application/src/repository/UserRepository/user_repository.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:talkify_chat_application/src/utils/popups/loaders.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  final userRepo = Get.put(UserRepository());
  Future<void> verifyOTP(String otp, UserModel user) async {
    try {
      var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
      if (isVerified) {
        user.id = FirebaseAuth.instance.currentUser?.uid;
        await userRepo.saveUserRecord(user);
        Get.offAll(HomeScreen());

        // Display a success snackbar
        Tloaders.successSnackBar(
            title: 'Welcome',
            message: 'Successfully loged in! Enjoy your chatting experience.');
      } else {
        // Display a failure snackbar
        Get.back();
        Tloaders.errorSnackBar(
            title: 'Error', message: 'Sorry please enter valid OTP');
      }
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      print(e.toString());
    }
  }
}
