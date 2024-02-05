import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    Key? key,
    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.blueGrey
                : lightThemeData(context).primaryColorDark.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Icon(
                btnIcon,
                size: 60.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getTextColor(context)),
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
