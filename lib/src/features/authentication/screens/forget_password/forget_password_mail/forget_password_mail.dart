// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

import 'package:talkify_chat_application/src/common/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/forget_password_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';
import 'package:talkify_chat_application/src/utils/validators/validation.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const FormHeaderWidget(
                  image_dark: "assets/images/splash_screen/splash-dark.png",
                  image_light: "assets/images/splash_screen/splash-light.png",
                  title: "Forget Password",
                  subtitle: "Enter your email to start reseting your password",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: controller.forgetPasswordFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.email,
                          validator: TValidator.validateEmail,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                              labelText: "E-Mail",
                              hintText: "Enter Registered email id",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                controller.sendPasswordResetEmail(),
                            child: Text("NEXT",
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? darkThemeData(context).primaryColorDark
                                      : lightThemeData(context)
                                          .primaryColorLight,
                                )),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).brightness == Brightness.dark
                                    ? darkThemeData(context).primaryColorLight
                                    : lightThemeData(context).primaryColorDark,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromHeight(50.0)),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
