import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/edit_profile_controller.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';
import 'package:talkify_chat_application/src/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditProfileController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => TValidator.validateEmail(value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          TValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailandPassword(),
                    child: Text("Submit",
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
                      fixedSize:
                          MaterialStateProperty.all(Size.fromHeight(50.0)),
                    ),
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
