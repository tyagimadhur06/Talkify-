import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/signup_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: InputDecoration(
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: InputDecoration(
                  label: Text("Phone No"),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // SignUpController.instance
                      //     .registerUser(controller.email.text.trim(), controller.password.text.trim());
                      SignUpController.instance
                          .phoneAuthentication(controller.phoneNo.text.trim());
                      Get.to(OtpScreen());
                    }
                  },
                  child: Text("SIGN UP",
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
                ),
              ),
            ],
          )),
    );
  }
}
