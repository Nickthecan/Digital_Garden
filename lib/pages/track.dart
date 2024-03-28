import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
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
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) {
          await Future.delayed(Duration.zero, () {
            Navigator.pushReplacementNamed(context, '/main_menu', arguments: {
              'userModel': userModel,
              'budgetModel': budgetModel,
              'purchaseList': purchases,
            });
          });
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFD3D3D3),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text("Tracking", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Container(
                  height: 1150,
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
                        child: Text("Month spending", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text("Daily spending", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                      ),
                      SizedBox(height: 10,),
                      for (int i = 1; i <= calculateNumberOfDays(); i++)
                        _buildDaySpending(i),

                    ],
                  ),
                ),
              ),
            ),
            /*SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Container(
                  height: 300,
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
                          child: Text("Weekly spending", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                        for (int i = 1; i <= calculateNumberOfWeeks(); i++)
                          _buildWeekSpending(i),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week 1", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              Expanded(
                                  child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week 2", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              Expanded(
                                  child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week 3", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              Expanded(
                                  child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week 4", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              Expanded(
                                  child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Week 5", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              Expanded(
                                  child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                            ],
                          ),
                        ),
                      ],
                  ),
                ),
              ),
            ),*/
            SliverToBoxAdapter(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Container(
                  height: 100,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                    child: ElevatedButton(
                      onPressed: () async {
                        List<PurchaseModel>? updatedPurchases = await Navigator.pushNamed(context, '/expense', arguments: {
                          'userModel': userModel,
                          'purchaseList': purchases,
                        }) as List<PurchaseModel>?;
                        if (updatedPurchases != null) {
                          setState(() {
                            purchases = updatedPurchases;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                      ),
                      child: Text("Add an Expense"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateNumberOfDays() {
    DateTime now  = DateTime.now();
    DateTime daysOfTheMonth = DateTime(now.year, now.month + 1, 0);
    return daysOfTheMonth.day;
  }

  _buildDaySpending(int dayNumber) {
    double amountSpentThatDay = budgetModel.calculateAmountSpentToday(purchases, dayNumber);
    double progressBarPercentage = amountSpentThatDay / budgetModel.totalAmount;

    setState(() {});

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("$dayNumber", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
          Expanded(
              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: progressBarPercentage, barRadius: Radius.circular(30))),
          Text("\$${amountSpentThatDay.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
        ],
      ),
    );
  }

  /*int calculateNumberOfWeeks() {
    DateTime now  = DateTime.now();
    DateTime daysOfTheMonth = DateTime(now.year, now.month + 1, 0);

  }

  _buildWeekSpending(int weekNumber) {

  }*/
}
