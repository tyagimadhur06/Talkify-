import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/common/common_widgets/success_screen/success_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/login_screen.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/utils/constants/text_strings.dart';
import 'package:talkify_chat_application/src/utils/helpers/helper_functions.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/login_screen/sent_email.png"),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'tyagimadhur@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                confirmEmailSubtitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                      image: "assets/images/login_screen/sent_email.png",
                      title: yourAccountCreated,
                      subtitle: yourAccountCreatedSubtitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    )),
                    child: Text("Continue",
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
                    )),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Email',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
