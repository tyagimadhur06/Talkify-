import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/utils/constants/text_strings.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/widgets/login_footer_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/widgets/login_form_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeaderWidget(
                  image_dark: "assets/images/splash_screen/splash-dark.png" , 
                  image_light: "assets/images/splash_screen/splash-light.png", 
                  title: loginTitle, 
                  subtitle: loginSubTitle),
                const LoginForm(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



