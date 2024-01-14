import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/firebase_options.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkify',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      home: OnboardingScreen(),
    );
  }
}

