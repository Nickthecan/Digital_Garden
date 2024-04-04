import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  late UserModel userModel;
  late List<PurchaseModel> purchases;
  TextEditingController _nameController = TextEditingController();
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
    purchases = data['purchaseList'];
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _purchaseCostController.dispose();
    _categoryController.dispose();
    super.dispose();
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
              child: Text("Add an Expense", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Container(
                width: 500,
                height: 450,
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
                      child: Text("Name of purchase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                      child: TextField(
                        controller: _nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Cost of purchase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
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
                      child: Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F))),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 30, 0),
                        child: DropdownMenu(
                          width: 335,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'food_drink', label: 'Food and Drink'),
                            DropdownMenuEntry(value: 'shopping', label: 'Shopping'),
                            DropdownMenuEntry(value: 'entertainment', label: 'Entertainment'),
                            DropdownMenuEntry(value: 'bills_and_utilities', label: 'Bills and Utilities'),
                            DropdownMenuEntry(value: 'personal', label: 'Personal'),
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
                  onPressed: () async {
                    String name = _nameController.text;
                    String purchaseCost = _purchaseCostController.text;
                    String category = _categoryController.text;

                    if (name.isNotEmpty && category.isNotEmpty && purchaseCost.isNotEmpty) {
                      await _addExpense();
                      Navigator.pop(context, purchases);
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill out all fields.'),
                        ),
                      );
                    }
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
    String name = _nameController.text;
    double purchaseCost = double.parse(_purchaseCostController.text);
    String category = _categoryController.text;
    DateTime now = DateTime.now();
    int purchaseID = await _getNextPurchaseID();

    await FirebaseFirestore.instance.collection('purchase').add({
      'purchaseName': name,
      'category': category,
      'cost': purchaseCost,
      'date': now,
      'purchaseID': purchaseID,
      'userID': userModel.uid
    });

    PurchaseModel purchaseModel = PurchaseModel(uid: userModel.uid, purchaseID: purchaseID, purchaseName: name, category: category, cost: purchaseCost, datePurchased: now);
    purchases.add(purchaseModel);
    return purchases;
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