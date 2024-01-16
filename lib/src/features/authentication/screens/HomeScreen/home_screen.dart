// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';

import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/calls_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/contacts_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/message_page.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/Pages/notification_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            index: 0,
            label: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 0),
          ),
          _NavigationBarItem(
            index: 1,
            label: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 1),
          ),
          _NavigationBarItem(
            index: 2,
            label: 'Calls',
            icon: CupertinoIcons.phone_fill,
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 2)
          ),
          _NavigationBarItem(
            index: 3,
            label: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 3)
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected == true ? kSecondaryColor : null,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected ? 
              const TextStyle(
                fontSize: 11,
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
              )
              :const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
