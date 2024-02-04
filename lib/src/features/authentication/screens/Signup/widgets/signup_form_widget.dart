import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/signup_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';
import 'package:talkify_chat_application/src/utils/validators/validation.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(SignUpController());
    

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: controller.signupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                validator: (value) =>
                    TValidator.validateEmptyText('Full Name', value),
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
                validator: (value) => TValidator.validateEmail(value),
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
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  label: Text("Phone No"),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(
                      () => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'I agree to',
                    ),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: isDark ? Colors.white : kSecondaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  isDark ? Colors.white : kSecondaryColor,
                            )),
                    TextSpan(
                      text: 'and',
                    ),
                    TextSpan(
                        text: 'Terms of use',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: isDark ? Colors.white : kSecondaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  isDark ? Colors.white : kSecondaryColor,
                            )),
                  ])),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signup();
                    //if (_formKey.currentState!.validate()) {
                    //---Email Password Authentication
                    // SignUpController.instance
                    //     .registerUser(controller.email.text.trim(), controller.password.text.trim());

                    //--Phone Otp Authentication
                    // SignUpController.instance
                    //     .phoneAuthentication(controller.phoneNo.text.trim());

                    //Get user and pass it to controller

                    //   final user = UserModel(
                    //       fullName: controller.fullName.text.trim(),
                    //       email: controller.email.text.trim(),
                    //       phoneNo: controller.phoneNo.text.trim(),
                    //       password: controller.password.text.trim());

                    //   SignUpController.instance.createUser(user);
                    // }
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
