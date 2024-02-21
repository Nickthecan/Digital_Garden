import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text("Add an Expense", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Container(
                width: 500,
                height: 250,
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
                      child: Text("Cost of purchase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Adjust the borderRadius as needed
                    ),
                    elevation: 8,
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                  ),
                  child: Text("Add Expense"),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
