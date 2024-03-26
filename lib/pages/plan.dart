import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';
import 'dart:core';

class Plan extends StatefulWidget {
  const Plan({super.key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  late UserModel userModel;
  late BudgetModel budgetModel;
  List<PurchaseModel> purchases = [];
  TextEditingController _budgetController = TextEditingController();

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
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userModel = data['userModel'];
    budgetModel = data['budgetModel'];

    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text("Spending Planner", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white),),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Container(
                height: 650,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Month budget", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text("\$${budgetModel.calculateAmountRemaining(purchases).toStringAsFixed(2)} left for ${getRemainingDays()} days", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: CircularPercentIndicator(radius: 140,
                            lineWidth: 45,
                            percent: budgetModel.amountSpent / budgetModel.totalAmount,
                            progressColor: Color(0xFF58E47F),
                            backgroundColor: Color(0xFFD3D3D3),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text('${((budgetModel.amountSpent / budgetModel.totalAmount) * 100).toInt()}%\nSpent',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xF22F2F2F),
                                    height: 1))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Spent", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                          Text("\$${budgetModel.amountSpent.toStringAsFixed(2)}", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Remaining", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                          Text("\$${budgetModel.calculateAmountRemaining(purchases).toStringAsFixed(2)}", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Your Budget", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                          Text("\$${budgetModel.totalAmount.toStringAsFixed(2)}", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {
                              editBudget(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF58E47F),
                            ),
                            child: Text("Edit Budget"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Container(
                height: 575,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Categories", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Food and Drink", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15,
                          progressColor: Color(0xFF58E47F),
                          backgroundColor: Color(0xFFD3D3D3),
                          percent: 0,
                          barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Shopping", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15,
                          progressColor: Color(0xFF58E47F),
                          backgroundColor: Color(0xFFD3D3D3),
                          percent: 0,
                          barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Entertainment", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15,
                          progressColor: Color(0xFF58E47F),
                          backgroundColor: Color(0xFFD3D3D3),
                          percent: 0,
                          barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text("\$0.00", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Bills", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15,
                          progressColor: Color(0xFF58E47F),
                          backgroundColor: Color(0xFFD3D3D3),
                          percent: 0,
                          barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Gas", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15,
                          progressColor: Color(0xFF58E47F),
                          backgroundColor: Color(0xFFD3D3D3),
                          percent: 0,
                          barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF58E47F),
                            ),
                            child: Text("Change Categories"),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future editBudget(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text("Edit Budget", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)))),
        content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F))),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Container(
                  width:110,
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*(\.[0-9]{0,2})?$')),
                    ],
                    controller: _budgetController,
                  ),
                ),
              ),
            ]
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  double newBudget = double.parse(_budgetController.text);
                  updateBudgetDB(newBudget);
                  budgetModel.totalAmount = newBudget;
                  submit(context);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Adjust the borderRadius as needed
                ),
                elevation: 8,
                foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
              ),
              child: Text("Update Budget"),
            ),
          ),
        ],
      )
  );

  void submit(context) {
    Navigator.pop(context);
  }

  getRemainingDays() {
    DateTime now = DateTime.now();
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    int daysRemaining = lastDayOfMonth.day - now.day;
    return daysRemaining;
  }

  void updateBudgetDB(double totalBudget) async {
    try {
      await FirebaseFirestore.instance.collection('budget').doc(userModel.uid).update({
        'totalAmount': totalBudget,
      });
      print("Budget's total amount has been updated in the DB");
    }
    catch (e) {
      print('Could not Access the DB to update the total Amount');
      print(e.toString());
    }
  }
}
