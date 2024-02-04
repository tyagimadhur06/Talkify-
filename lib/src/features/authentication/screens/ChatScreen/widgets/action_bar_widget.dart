import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/common_widgets/glowing_action_button.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                )
              )
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                CupertinoIcons.camera_fill
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 24,
            ),
            child: GlowingActionButton(
              color: accent,
              icon: Icons.send_rounded,
              onPressed: (){},
            ), 
          )
        ],
      ),
    );
  }
}
