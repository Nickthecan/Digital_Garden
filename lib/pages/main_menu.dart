import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Color(0xFF3C9FE7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Sign out")),
                  ),
                  SizedBox(height: 100,),
                  Center(child: Text("Tree", style: TextStyle(fontWeight: FontWeight.bold),))],
              ),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.65, 0.65 , 1.0],
                    colors: [Color(0xFF58E47F), Color(0xFF58E47F) , Color(0xFFD2D2D2), Color(0xFFD2D2D2)],
                  )
              ),
              //At a glance Column
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 100, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                            Text("At a Glance", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 24, fontWeight: FontWeight.w500,)),
                            Text("\$", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w500,)),
                            Text("Your spending as of Month, Day, Year", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 12, fontWeight: FontWeight.w400)),
                            SizedBox(height: 50),
                            Text("Chart", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,)),
                            SizedBox(height: 400),
                          ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/plan');
                                  },
                                  style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(12),),
                                  child: Image.network('https://img.icons8.com/sf-regular/48/literature.png', width: 32, height: 32,),
                                ),
                                SizedBox(height: 8),
                                Text("Plan", style: TextStyle(color: Color(0xF22F2F2F), fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/track');
                                  },
                                  style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(12),),
                                  child: Image.network('https://img.icons8.com/material-outlined/24/graph.png', width: 32, height: 32,),
                                ),
                                SizedBox(height: 8),
                                Text("Track", style: TextStyle(color: Color(0xF22F2F2F), fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/goal_page');
                                  },
                                  style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(12),),
                                  child: Image.network('https://img.icons8.com/fluency-systems-regular/48/trophy--v1.png', width: 32, height: 32,),
                                ),
                                SizedBox(height: 8),
                                Text("Goals", style: TextStyle(color: Color(0xF22F2F2F), fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/settings');
                                  },
                                  style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(12),),
                                  child: Image.network('https://img.icons8.com/?size=256&id=82535&format=png', width: 32, height: 32,),
                                ),
                                SizedBox(height: 8),
                                Text("Settings", style: TextStyle(color: Color(0xF22F2F2F), fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
