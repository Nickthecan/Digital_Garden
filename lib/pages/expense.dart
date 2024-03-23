import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  late UserModel userModel;
  TextEditingController _purchaseCostController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

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
                      child: Text("Cost of purchase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*(\.[0-9]{0,2})?$')),
                        ],
                        controller: _purchaseCostController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: DropdownMenu(
                          width: 335,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'food_drink', label: 'Food and Drink'),
                            DropdownMenuEntry(value: 'shopping', label: 'Shopping'),
                            DropdownMenuEntry(value: 'entertainment', label: 'Entertainment'),
                            DropdownMenuEntry(value: 'bills', label: 'Bills'),
                            DropdownMenuEntry(value: 'gas', label: 'Gas'),
                          ],
                          controller: _categoryController,
                        )
                    ),
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
                    _addExpense();
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

  _addExpense() async {
    double purchaseCost = double.parse(_purchaseCostController.text);
    String category = _categoryController.text;
    DateTime now = DateTime.now();
    int purchaseID = await _getNextPurchaseID();

    await FirebaseFirestore.instance.collection('purchase').doc(userModel.uid).set({
      'category': category,
      'cost': purchaseCost,
      'date': now,
      'purchaseID': purchaseID,
    });

    PurchaseModel purchaseModel = PurchaseModel(uid: userModel.uid, purchaseID: purchaseID, category: category, cost: purchaseCost, datePurchased: now);
    return purchaseModel;
  }

  Future _getNextPurchaseID() async {
    try {
      DocumentSnapshot purchaseIDSnapShot = await FirebaseFirestore.instance.collection('ids').doc(userModel.uid).get();
      Map<String, dynamic> data = purchaseIDSnapShot.data() as Map<String, dynamic>;
      int newPurchaseID = data['newPurchaseID'];

      FirebaseFirestore.instance.collection('ids').doc(userModel.uid).update({
        'newPurchaseID': newPurchaseID + 1,
      });

      return newPurchaseID;
    }
    catch (e) {
      print("Error retrieving the new Purchase ID");
      print(e.toString());
    }
  }
}
