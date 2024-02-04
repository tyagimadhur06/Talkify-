import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/common/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

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
                const FormHeaderWidget(
                  image_dark: "assets/images/splash_screen/splash-dark.png",
                  image_light: "assets/images/splash_screen/splash-light.png",
                  title: "Forget Password",
                  subtitle:
                      "Enter 10 digit phone number",
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