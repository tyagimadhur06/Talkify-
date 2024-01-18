import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/BottomNavigationWidgets/glowing_action_button.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<MyBottomNavigationBar> createState() => MyBottomNavigationBarState();
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(top:16 , left: 8 , right : 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                label: 'Chats',
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

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: GlowingActionButton(
                  color: kSecondaryColor, 
                  icon: MdiIcons.robot,
                  onPressed: (){},
                  label: 'AI',
                ),
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
        ),
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
        width: 70,
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