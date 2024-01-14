import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/common_widgets/form/form_header_widget.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children:[
                const SizedBox(height: 120,),
                const FormHeaderWidget(
                  image_dark: "assets/images/splash_screen/splash-dark.png", 
                  image_light: "assets/images/splash_screen/splash-light.png",
                  title: "Forget Password", 
                  subtitle: "Select one of the options given below to reset your password",
                  textAlign: TextAlign.center,
                ),
        
                const SizedBox(height: 30.0,),
        
                Form(child: Column(
                  children: [
                      TextFormField(
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                          labelText: "E-Mail",
                          hintText: "Enter Registered email id",
                          border: OutlineInputBorder()),
                      ),
                
                    const SizedBox(height: 20,),
        
                    SizedBox(
                      width: double.infinity,
                      child:  ElevatedButton(
                  onPressed: () {},
                  child: Text("LOGIN",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? darkThemeData(context).primaryColorDark
                            : lightThemeData(context).primaryColorLight,
                      )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).brightness == Brightness.dark
                          ? darkThemeData(context).primaryColorLight
                          : lightThemeData(context).primaryColorDark,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(50.0)),
                  ),
                ),
              ),
            ],
          ))
        ],
            ),
            ),
          ),
      ),);
  }
}