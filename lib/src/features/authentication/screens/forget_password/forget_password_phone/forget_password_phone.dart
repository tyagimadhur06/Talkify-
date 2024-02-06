// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:talkify_chat_application/src/common/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({
    Key? key,
    required this.headText,
    required this.headTextSubtitle,
  }) : super(key: key);
  final String headText, headTextSubtitle;
  @override
  Widget build(BuildContext context) {
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
                FormHeaderWidget(
                  image_dark: "assets/images/splash_screen/splash-dark.png",
                  image_light: "assets/images/splash_screen/splash-light.png",
                  title: headText,
                  subtitle:headTextSubtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mobile_friendly_rounded),
                          labelText: "Phone",
                          hintText: "Enter Phone Number",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(OtpScreen());
                        },
                        child: Text("NEXT",
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? darkThemeData(context).primaryColorDark
                                  : lightThemeData(context).primaryColorLight,
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
                          fixedSize:
                              MaterialStateProperty.all(Size.fromHeight(50.0)),
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
