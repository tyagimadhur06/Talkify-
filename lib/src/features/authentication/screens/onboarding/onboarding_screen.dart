import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/Login/login_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: onboard_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                        image: onboard_data[index].image,
                        title: onboard_data[index].title,
                        description: onboard_data[index].description,
                      )),
            ),
            Row(children: [
              ...List.generate(
                onboard_data.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                width:  _pageIndex == onboard_data.length - 1 ? 150 : 60,
                child: ElevatedButton(
                  onPressed: () {
                    _pageIndex == onboard_data.length - 1 ?
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                       : _pageController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? darkThemeData(context).primaryColorLight
                            : lightThemeData(context).primaryColorDark,
                    shape: _pageIndex == onboard_data.length - 1
                      ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                      )
                        : CircleBorder(),
                    padding: EdgeInsets.all(0), // Remove padding
                    minimumSize: Size(0, 0), // Remove minimumSize constraint
                  ),
                  child: _pageIndex == onboard_data.length - 1?
                     Text("Login/SignUp",
                     textAlign:TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                        ? darkThemeData(context).primaryColorDark
                        : lightThemeData(context).primaryColorLight,
                      )   
                    ) :
                     Image.asset(
                      "assets/images/onboarding_screen/arrow-right.png",
                        color: Theme.of(context).brightness == Brightness.dark
                        ? darkThemeData(context).primaryColorDark
                        : lightThemeData(context).primaryColorLight,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 15 : 7,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).brightness == Brightness.dark
            ? darkThemeData(context).primaryColorLight
            : lightThemeData(context).primaryColorDark : Theme.of(context).brightness == Brightness.dark
            ? darkThemeData(context).primaryColorLight
            : lightThemeData(context).primaryColorDark.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> onboard_data = [
  Onboard(
      image: "assets/images/onboarding_screen/image_1.png",
      title: "Connet With Your Friends",
      description:
          "Talk to your favourite person , freinds , anyone , anywhere on your fingertips"),
  Onboard(
      image: "assets/images/onboarding_screen/image_2.png",
      title: "End to End Encrypted Chats",
      description:
          "Chat Freely without any hesitation of someone spying on you.Talkify comes with End to End enrypted chats"),
  Onboard(
      image: "assets/images/onboarding_screen/image_3.png",
      title: "Embedded Gen AI",
      description:
          "Take assistance and acquire information from Large Language AI Models like chatGpt , Bard on your fingertips"),
  Onboard(
      image: "assets/images/onboarding_screen/image_4.png",
      title: "Let's Talk",
      description: "Sign Up and Start your instant chatting journey"),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
