import 'package:flutter/material.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';
import 'package:intl/intl.dart';

class PurchaseListView extends StatefulWidget {
  const PurchaseListView({super.key});

  @override
  State<PurchaseListView> createState() => _PurchaseListViewState();
}

class _PurchaseListViewState extends State<PurchaseListView> {
  late UserModel userModel;
  late BudgetModel budgetModel;
  late List<PurchaseModel> purchases;
  late List<bool> expandedStates;

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
    purchases.sort((b, a) => a.datePurchased.compareTo(b.datePurchased));
    expandedStates = List<bool>.filled(purchases.length + 1, false);
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
              child: Text("Purchases", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: purchases.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
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
                                _loadData();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                          ),
                          child: Text("Add an Expense"),
                        ),
                      );
                    }
                    else {
                      PurchaseModel purchase = purchases[index - 1];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          height: expandedStates[index] ? 175 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      expandedStates[index] = !expandedStates[index];
                                    });
                                  },
                                  title: Text("${purchase.purchaseName}"),
                                  subtitle: Text("\$${purchase.cost.toStringAsFixed(2)}", style: TextStyle(fontSize: 20),),
                                ),
                                if (expandedStates[index])
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Category: ${purchase.category}"),
                                        SizedBox(height: 10,),
                                        Text("Date Purchased: ${calculateDate(purchase.datePurchased)}")
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateDate(DateTime datePurchased) {
    String month = DateFormat('MMM').format(datePurchased);
    return "$month ${datePurchased.day}, ${datePurchased.year}";
  }
}
