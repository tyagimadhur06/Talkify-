import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/login_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Signup/signup_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';
import 'package:talkify_chat_application/src/utils/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Icon(Icons.mobile_friendly_rounded),
            onPressed: () => Get.to(() => ForgetPasswordPhoneScreen(headText: enterPhoneNo,headTextSubtitle: enterPhoneNoSubTitle,)),
            label: Text("Sign-In with Phone Number"),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                  Size.fromHeight(50.0)), // Set your desired height
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage("assets/images/login_screen/google.png"),
              width: 20.0,
            ),
            onPressed: () => controller.googleSignIn(),
            label: Text("Sign-In with Google"),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                  Size.fromHeight(50.0)), // Set your desired height
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                text: "Don't have an Account? ",
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: "Signup",
                    style: TextStyle(color: Colors.blue),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
