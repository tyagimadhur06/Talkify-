// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:talkify_chat_application/src/features/authentication/controllers/otp_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/utils/constants/text_strings.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    Key? key,
    required this.phoneNo,
  }) : super(key: key);
  final String phoneNo;
  @override
  Widget build(BuildContext context) {
    var otp;
    var otpController = Get.put(OTPController());
    var user = Get.find<UserModel>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            Text(
              otpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "$otpMessage $phoneNo",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.blueGrey
                  : Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                otpController.verifyOTP(otp, user);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  otpController.verifyOTP(otp, user);
                },
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
                  fixedSize: MaterialStateProperty.all(Size.fromHeight(50.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
