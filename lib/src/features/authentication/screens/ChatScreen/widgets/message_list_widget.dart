import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          _DateLable(lable: 'Yesterday'),
          _MessageTile(
            message: 'Hi , Kallu! How are you doing?',
            messageData: '12 : 01 P.M',
          ),
          _MessageOwnTile(
            message: 'Great bro....',
            messageData: '12 : 02 P.M',
          ),
          _MessageTile(
            message: 'Burger Khane chalega??',
            messageData: '12 : 03 P.M',
          ),
          _MessageOwnTile(
            message: 'Haan bhai bilkulll',
            messageData: '12 : 04 P.M',
          ),
          _MessageTile(
            message: 'Aaaja bohot bohot bohot jaldi',
            messageData: '12 : 05 P.M',
          ),
          _MessageOwnTile(
            message: 'Aagaya bass 10 min ',
            messageData: '12 : 06 P.M',
          ),
        ],
      ),
    );
  }
}

class _DateLable extends StatelessWidget {
  const _DateLable({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              lable,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
    required this.messageData,
  }) : super(key: key);

  final String message;
  final String messageData;

  static const _borderRadius = 26.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageData,
                style: const TextStyle(
                  color: textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
    required this.messageData,
  }) : super(key: key);

  final String message;
  final String messageData;

  static const _borderRadius = 26.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    bottomLeft: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Text(
                  message,
                  style: const TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageData,
                style: const TextStyle(
                  color: textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}