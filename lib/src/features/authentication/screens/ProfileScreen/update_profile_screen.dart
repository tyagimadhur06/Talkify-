import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/controllers/profile_controller.dart';
import 'package:talkify_chat_application/src/features/authentication/models/user_model.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          "Edit Profile",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/images/Profile/profile_image.jpg")
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
                                LineAwesomeIcons.camera,
                                size: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            initialValue: userData.fullName,
                            decoration: InputDecoration(
                              label: Text("Full Name"),
                              prefixIcon: Icon(Icons.person_outline_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: userData.email,
                            decoration: InputDecoration(
                              label: Text("Email"),
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: userData.phoneNo,
                            decoration: InputDecoration(
                              label: Text("Phone No"),
                              prefixIcon: Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: userData.password,
                            decoration: InputDecoration(
                              label: Text("Password"),
                              prefixIcon: Icon(Icons.fingerprint),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: (){},
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: isDark
                                      ? darkThemeData(context).primaryColorDark
                                      : lightThemeData(context)
                                          .primaryColorLight,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? darkThemeData(context).primaryColorLight
                                    : lightThemeData(context).primaryColorDark,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(TextSpan(
                                  text: 'Joined ',
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: '25 January 2024',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ))
                                  ])),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.red.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                  ),
                                  child: const Text('Delete')),
                            ],
                          )
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
