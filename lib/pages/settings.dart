import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_garden/features/models/user_model.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late UserModel userModel;
  TextEditingController _userNameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  Future<void> _loadData() async {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userModel = data['userModel'];
    setState(() {});
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.6, 0.6, 1.0],
            colors: [Color(0xFFD3D3D3), Color(0xFFD3D3D3), Color(0xFF58E47F), Color(0xFF58E47F)],
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Container(
                  height: 500,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 50, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://img.icons8.com/pastel-glyph/64/user-male-circle.png', width: 64, height: 64),
                            Text("${userModel.username}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1, color: Color(0xF22F2F2F))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Divider(
                          height: 20,
                          color: Color(0xF22F2F2F),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: TextButton(
                          onPressed: () {
                            changeUserName(context);
                          },
                          child: Text("Change username", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xF22F2F2F))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Divider(
                          height: 20,
                          color: Color(0xF22F2F2F),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(context, "/");
                          },
                          child: Text("Log out", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xF22F2F2F)))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future changeUserName(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(child: Text("New username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)))),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F))),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Container(
              width:200,
              child: TextField(
                autofocus: true,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                controller: _userNameController,
              ),
            ),
          ),
        ]
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              setState(() {
                String newUserName = _userNameController.text;
                userModel.editUserName(newUserName);
                _loadData();
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Adjust the borderRadius as needed
              ),
              elevation: 8,
              foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
            ),
            child: Text("Update UserName"),
          ),
        ),
      ],
    )
  );
}
