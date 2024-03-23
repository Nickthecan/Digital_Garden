import 'package:digital_garden/features/models/purchase_model.dart';

class BudgetModel {
  late final String uid;
  late double totalAmount;
  late double amountRemaining;
  late double amountSpent;

  BudgetModel( {required this.uid, required this.totalAmount, required this.amountRemaining, required this.amountSpent} );

  double calculateAmountRemaining() {
    amountRemaining = totalAmount - amountSpent;
    return amountRemaining;
  }

  calculateAmountSpent(List<PurchaseModel> purchases) {
    amountSpent = 0;
    for (var purchase in purchases) {
      amountSpent += purchase.cost;
    }
    return amountSpent;
  }
}