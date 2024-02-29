// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

import 'package:talkify_chat_application/src/common/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/login_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  ForgetPasswordPhoneScreen({
    Key? key,
    required this.headText,
    required this.headTextSubtitle,
  }) : super(key: key);
  final String headText, headTextSubtitle;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                  subtitle: headTextSubtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.phoneNo,
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
                              if (controller.loginFormKey.currentState!
                                  .validate()) {
                                final user = UserModel(
                                    fullname: '',
                                    email: '',
                                    phoneNo: controller.phoneNo.text.trim(),
                                    profilePicture: '');

                                controller.createUserPhoneAuth(user);
                              }
                            },
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
