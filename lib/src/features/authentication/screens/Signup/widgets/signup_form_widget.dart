import 'package:flutter/material.dart';
import 'package:talkify_chat_application/src/utils/theme/theme.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder(), 
                ),
              ),
    
              const SizedBox(height: 10,),
    
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(), 
                ),
              ),
    
              const SizedBox(height: 10,),
    
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Phone No"),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(), 
                ),
              ),
    
              const SizedBox(height: 10,),
    
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder(), 
                ),
              ),
    
              const SizedBox(height: 20,),
    
              SizedBox(
                width: double.infinity,
                
                child: ElevatedButton(
                    
                    onPressed: (){}, 
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                            ? darkThemeData(context).primaryColorDark
                            : lightThemeData(context).primaryColorLight,
                      )   
                    ),
                    
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
          )
        ),
    );
  }
}