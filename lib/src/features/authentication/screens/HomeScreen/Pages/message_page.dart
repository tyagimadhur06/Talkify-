// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'package:talkify_chat_application/helpers.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/models/models.dart';
import 'package:talkify_chat_application/src/features/authentication/models/story_data.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/MessageTileWidgets/message_title_widget.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/avatar.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/StoryCardWidgets/story_card_widget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        ),
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDateTime();
    return MessageTitle(
      messageData: MessageData(
      senderName: faker.person.name(),
      message: faker.lorem.sentence(),
      messageData: date,
      dateMessage: Jiffy.parse(date.toString()).fromNow(),
      profilePicture: Helpers.randomPictureUrl(),
    ));
  }
}




