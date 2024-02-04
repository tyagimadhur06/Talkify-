import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Signup/widgets/signup_footer_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Signup/widgets/signup_form_widget.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                FormHeaderWidget(image_dark: "assets/images/splash_screen/splash-dark.png" , 
                image_light:"assets/images/splash_screen/splash-light.png",
                title: "Get On Board!", 
                subtitle: "Create your profile to start your Journey."
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

