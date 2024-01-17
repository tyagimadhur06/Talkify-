// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/helpers.dart';
import 'package:talkify_chat_application/src/common_widgets/icon_buttons.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/calls_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/contacts_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/message_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/notification_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/avatar.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/BottomNavigationWidgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Chats');

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pagetTitles = const [
    'Chats',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pagetTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search , 
            onTap:(){},
          )
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Avatar.small(url:Helpers.randomPictureUrl(),))],
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}
