import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/home_screen.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(HomeScreen()) : Get.back();
  }
}
