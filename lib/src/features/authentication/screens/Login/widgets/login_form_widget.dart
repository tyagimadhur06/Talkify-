// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:talkify_chat_application/src/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/constants/text_strings.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/home_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_options/build_show_modalBottomSheet.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "E-Mail",
                hintText: "Enter Registered email id",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: "Password",
              hintText: "Enter Password",
              border: OutlineInputBorder(),
              suffix: IconButton(
                onPressed: null,
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.blue),
                  ))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: Text("LOGIN",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
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
                  fixedSize: MaterialStateProperty.all(Size.fromHeight(50.0)),
                ),
              )),
        ],
      ),
    ));
  }
}
