import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double containerOffset = 0;
  late FocusNode textFocusNode;
  late FocusNode pwFocusNode;
  late FocusNode confirmpwFocusNode;
  late double titleOpacity;
  late bool isSignIn;

  @override
  void initState() {
    super.initState();
    textFocusNode = FocusNode();
    pwFocusNode = FocusNode();
    confirmpwFocusNode = FocusNode();
    titleOpacity = 1;
    isSignIn = false;

    textFocusNode.addListener(_handleFocus);
    pwFocusNode.addListener(_handleFocus);
    confirmpwFocusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    setState(() {
      if (isSignIn) {
        containerOffset = (textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? -225 : 0;
      }
      else {
        containerOffset = (textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? -150 : 0;
      }
      titleOpacity = (textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? 0 : 1;
    });
  }

  @override
  void dispose() {
    textFocusNode.dispose();
    pwFocusNode.dispose();
    confirmpwFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: titleOpacity,
                    child: Text(
                      'Digital\nGarden',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                        )),
                  ),
                  SizedBox(height: 90,),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(0, containerOffset, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Username", style: TextStyle(
                          color: Color(0xF22F2F2F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                        TextField(
                          focusNode: textFocusNode,
                        ),
                        SizedBox(height: 20,),
                        Text("Password", style: TextStyle(
                          color: Color(0xF22F2F2F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                        TextField(
                          obscureText: true,
                          focusNode: pwFocusNode,
                        ),
                        Visibility(
                            visible: isSignIn,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20,),
                                Text("Confirm Password", style: TextStyle(
                                  color: Color(0xF22F2F2F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                                TextField(
                                  obscureText: true,
                                  focusNode: confirmpwFocusNode,
                                ),

                              ],
                            ),
                        ),
                        SizedBox(height: 20,),
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
                          child: Text("Sign ${isSignIn ? 'up' : 'in'}"),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(0, containerOffset, 0),
                    child: TextButton(onPressed: () {
                      setState(() {
                        isSignIn = !isSignIn;
                      });
                    },
                        child: Text("Sign ${isSignIn ? 'in' : 'up'}", style: TextStyle(color: Color(0xF22F2F2F)))
                    ),
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






