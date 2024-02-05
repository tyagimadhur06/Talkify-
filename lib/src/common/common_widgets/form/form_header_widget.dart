// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    required this.image_dark,
    required this.image_light,
    required this.title,
    required this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String image_dark, image_light, title, subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Theme.of(context).brightness == Brightness.dark
            ? Image.asset(
                image_dark,
                height: size.height * 0.2,
              )
            : Image.asset(image_light, height: size.height * 0.2),
        Text(
          title,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: FontWeight.bold,
                color: getTextColor(context),
              ),
        ),
        Text(
          subtitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
