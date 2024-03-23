import 'package:digital_garden/Helpers/chart.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late UserModel userModel;
  late BudgetModel budgetModel;
  List<PurchaseModel> purchases = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  Future<void> _loadData() async {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userModel = data['userModel'];
    budgetModel = data['budgetModel'];
    purchases = data['purchaseList'];
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 407.143,
              color: Color(0xFF3C9FE7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: Text("Sign out")),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('assets/tree5.png'),
                    ),
                  ),
                ],
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
                    stops: [0.0, 0.5, 0.5 , 1.0],
                    colors: [Color(0xFF58E47F), Color(0xFF58E47F) , Color(0xFFD2D2D2), Color(0xFFD2D2D2)],
                  )
              ),
              //At a glance Column
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
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
                          Text("\$${budgetModel.calculateAmountSpent(purchases).toStringAsFixed(2)}", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w500,)),
                          Text("Your spending as of ${calculateDate()}", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 12, fontWeight: FontWeight.w400)),
                          SizedBox(height: 50),
                          Chart(),
                          SizedBox(height: 100),
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
                                    Navigator.pushNamed(context, '/plan', arguments: {
                                      'userModel': userModel,
                                      'budgetModel': budgetModel,
                                      'purchaseList': purchases,
                                    });
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
                                    Navigator.pushNamed(context, '/track', arguments: {
                                      'userModel': userModel,
                                      'budgetModel': budgetModel,
                                      'purchaseList': purchases,
                                    });
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
                                    Navigator.pushNamed(context, '/goal_page', arguments: {
                                      'userModel': userModel,
                                    });
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
                                    Navigator.pushNamed(context, '/settings', arguments: {
                                      'userModel': userModel,
                                    });
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

  /*void _fetchBudget() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('budget').doc(userModel.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> budgetData = documentSnapshot.data() as Map<String, dynamic>;
        double totalAmount = budgetData['totalAmount'];
        double amountRemaining = budgetData['amountRemaining'];
        double amountSpent = budgetData['amountSpent'];

        setState(() {
          budgetModel = BudgetModel(uid: userModel.uid, totalAmount: totalAmount, amountRemaining: amountRemaining, amountSpent: amountSpent);
          print('Budget Loaded');
          isLoading = false;
        });
      }
      else {
        FirebaseFirestore.instance.collection('budget').doc(userModel.uid).set({
          'amountRemaining': 0.0,
          'amountSpent': 0.0,
          'totalAmount': 0.0,
        });

        setState(() {
          budgetModel = BudgetModel(uid: userModel.uid, totalAmount: 0.0, amountRemaining: 0.0, amountSpent: 0.0);
          print('New Budget Created');
          isLoading = false;
        });
      }
    }
    catch (e) {
      print('error occurred whilst fetching the budget');
      print(e.toString());
      isLoading = false;
    }
  }*/

  calculateDate() {
    DateTime now = DateTime.now();
    String month = DateFormat('MMM').format(now);
    return "$month ${now.day}, ${now.year}";
  }
}
