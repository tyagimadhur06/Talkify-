// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/route_manager.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:talkify_chat_application/helpers.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/avatar.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/update_profile_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/widgets/profile_menu.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          "Profile",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage(
                              "/Users/tyagimadhur_06/Documents/talkify_chat_application/assets/images/Profile/profile_image.jpg")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kSecondaryColor),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Faker().person.name(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                Faker().internet.email(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: isDark
                          ? darkThemeData(context).primaryColorDark
                          : lightThemeData(context).primaryColorLight,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? darkThemeData(context).primaryColorLight
                            : lightThemeData(context).primaryColorDark,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              const Divider(
                color: Colors.transparent,
              ),

              const SizedBox(
                height: 10,
              ),

              //Menu
              ProfileMenuWidget(
                title: 'Settings',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Saved Messages',
                icon: LineAwesomeIcons.save,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Wallet',
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),

              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const SizedBox(
                height: 10,
              ),

              ProfileMenuWidget(
                title: 'Information',
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Logout',
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
