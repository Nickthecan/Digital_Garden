import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Plan extends StatefulWidget {
  const Plan({super.key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text("Spending Planner", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
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
                      child: Text("Month Budget", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text("\$0.00 left for # days", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: CircularPercentIndicator(radius: 140, lineWidth: 45, percent: 0.4, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), circularStrokeCap: CircularStrokeCap.round,
                          center: Text('40%\nSpent', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xF22F2F2F), height: 1))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Spent", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Remaining", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Your Budget", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                          Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
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
                      child: Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Food and Drink", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), percent: 0.37, barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Shopping", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), percent: 0.37, barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Entertainment", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), percent: 0.37, barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text("\0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Bills", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), percent: 0.37, barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Gas", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: LinearPercentIndicator(lineHeight: 15, progressColor: Color(0xFF58E47F), backgroundColor: Color(0xFFD3D3D3), percent: 0.37, barRadius: Radius.circular(30)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text("\$0.00", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
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
          )
        ],
      ),
    );
  }
}
