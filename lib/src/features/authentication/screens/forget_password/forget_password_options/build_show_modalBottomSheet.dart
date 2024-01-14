import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/constants/text_strings.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: getTextColor(context),
                  ),
            ),
            Text(
              forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-Mail",
              subTitle: resetViaEmail,
              onTap: () {
                Get.to(ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: "Phone",
              subTitle: resetViaPhone,
              onTap: () {
                Get.to(ForgetPasswordPhoneScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
