import 'package:digital_garden/features/models/purchase_model.dart';

class BudgetModel {
  late final String uid;
  late double totalAmount;

  BudgetModel( {required this.uid, required this.totalAmount} );

  double calculateAmountRemaining(List<PurchaseModel> purchases) {
    double amountRemaining = 0;
    amountRemaining = totalAmount - calculateAmountSpent(purchases);
    return amountRemaining;
  }

  calculateAmountSpent(List<PurchaseModel> purchases) {
    double amountSpent = 0;
    for (var purchase in purchases) {
      amountSpent += purchase.cost;
    }
    return amountSpent;
  }

  calculateAmountSpentToday(List<PurchaseModel> purchases, int day) {
    double amountSpentToday = 0;
    for (var purchase in purchases) {
      DateTime dayPurchased = purchase.datePurchased;
      if (dayPurchased.day == day) {
        amountSpentToday += purchase.cost;
      }
    }
    return amountSpentToday;
  }
}