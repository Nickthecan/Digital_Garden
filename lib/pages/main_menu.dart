import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_garden/Helpers/chart.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late UserModel userModel;
  late BudgetModel budgetModel;
  List<PurchaseModel> purchases = [];
  late String treeStatus;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
    });

    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userModel = data['userModel'];
    budgetModel = data['budgetModel'];
    purchases = data['purchaseList'];
    treeStatus = await userModel.calculateTreeStatus(budgetModel, purchases);

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Color(0xFF58E47F),
        body: Center(
          child: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 64),
        ),
      );
    }

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) {
          await Future.delayed(Duration.zero, () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, '/');
          });
          return;
        }
      },
      child: Scaffold(
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
                        image: AssetImage('assets/$treeStatus.png'),
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
                            SizedBox(height: 5),
                            Text("\$${budgetModel.calculateAmountSpentThisMonth(purchases, DateTime.now().month).toStringAsFixed(2)}", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w500,)),
                            SizedBox(height: 5),
                            Text("Your monthly spending as of ${calculateDate()}", style: TextStyle(color: Color(0xF22F2F2F), fontSize: 12, fontWeight: FontWeight.w400)),
                            SizedBox(height: 40),
                            Chart(budgetModel: budgetModel, purchases: purchases),
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
                                      Navigator.pushNamed(context, '/purchase_list_view', arguments: {
                                        'userModel': userModel,
                                        'budgetModel': budgetModel,
                                        'purchaseList': purchases,
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(12),),
                                    child: Image.network('https://img.icons8.com/material-outlined/24/purchase-order.png', width: 32, height: 32,),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Expenses", style: TextStyle(color: Color(0xF22F2F2F), fontWeight: FontWeight.w500)),
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
      ),
    );
  }

  calculateDate() {
    DateTime now = DateTime.now();
    String month = DateFormat('MMM').format(now);
    return "$month ${now.day}, ${now.year}";
  }
}
