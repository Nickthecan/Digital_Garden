import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.65, 0.65 , 1.0],
            colors: [Color(0xFF58E47F), Color(0xFF58E47F) ,Colors.white, Colors.white],
          )
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Digital\nGarden',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      )),
                  SizedBox(height: 90,),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Username", style: TextStyle(
                          color: Color(0xF22F2F2F),
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        )),
                        SizedBox(height: 50,),
                        Text("Password", style: TextStyle(
                          color: Color(0xF22F2F2F),
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        )),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/main_menu');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0), // Adjust the borderRadius as needed
                            ),
                            elevation: 8,
                            foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                          ),
                          child: Text("Sign in"),
                        ),
                      ],
                    ),
                  ),
                  TextButton(onPressed: () {},
                      child: Text("Sign up", style: TextStyle(color: Color(0xF22F2F2F)),)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






