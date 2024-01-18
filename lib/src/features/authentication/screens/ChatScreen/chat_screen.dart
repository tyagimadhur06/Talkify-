// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:talkify_chat_application/src/common_widgets/icon_buttons.dart';
import 'package:talkify_chat_application/src/features/authentication/models/message_data.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ChatScreen/widgets/action_bar_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ChatScreen/widgets/app_bar_tile_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ChatScreen/widgets/message_list_widget.dart';


class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  const ChatScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
              icon: CupertinoIcons.back,
              onTap: () {
                Get.back();
              }),
        ),
        title: AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DemoMessageList()),
            ActionBar(),
        ]
      ),
    );
  }
}