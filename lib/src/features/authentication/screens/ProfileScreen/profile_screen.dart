// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:talkify_chat_application/src/features/personalization/controllers/user_controller.dart';
import 'package:talkify_chat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/update_profile_screen.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/ProfileScreen/widgets/profile_menu.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    //final controller = UserController.instance;
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
                      child: Image.asset(
                          "assets/images/Profile/profile_image.jpg"),
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
              Obx(
                () => Text(
                  controller.user.value.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.user.value.email,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => {
                    Get.to(() => UpdateProfileScreen()),
                  }, 
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
                onPress: () => AuthenticationRepository.instance.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
