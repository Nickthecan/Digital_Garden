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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("1", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("2", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("3", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("4", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("5", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("6", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("7", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("8", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("9", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("10", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("11", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("12", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("13", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("14", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("15", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("16", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("17", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("18", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("19", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("20", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("21", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("22", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("23", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("24", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("25", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("26", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("27", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("28", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("29", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("30", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Expanded(
                              child: LinearPercentIndicator(lineHeight: 10, progressColor: Color(0xFF58E47F), backgroundColor: Colors.white, percent: 0.0, barRadius: Radius.circular(30))),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("31", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
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
          ),
          SliverToBoxAdapter(
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
          ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/expense', arguments: {
                        'userModel': userModel,
                      });
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
    );
  }
}
