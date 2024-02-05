// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:talkify_chat_application/src/common/styles/spacing_styles.dart';
import 'package:talkify_chat_application/src/utils/helpers/helper_functions.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingwithAppBarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(image , width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                subtitle,
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
                    onPressed: onPressed,
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
            ],
          ),
        ),
      ),
    );
  }
}
