import 'package:digital_garden/features/models/purchase_model.dart';

class BudgetModel {
  late final String uid;
  late double totalAmount;

  BudgetModel( {required this.uid, required this.totalAmount} );

  double calculateAmountRemaining(List<PurchaseModel> purchases) {
    double amountRemaining = 0;
    amountRemaining = totalAmount - calculateAmountSpentThisMonth(purchases, DateTime.now().month);
    return amountRemaining;
  }

  calculateAmountSpent(List<PurchaseModel> purchases) {
    double amountSpent = 0;
    for (var purchase in purchases) {
      amountSpent += purchase.cost;
    }
    return amountSpent;
  }

  calculateAmountSpentToday(List<PurchaseModel> purchases, int day, int month) {
    double amountSpentToday = 0;
    for (var purchase in purchases) {
      DateTime dayPurchased = purchase.datePurchased;
      if (dayPurchased.day == day && dayPurchased.month == month) {
        amountSpentToday += purchase.cost;
      }
    }
    return amountSpentToday;
  }

  calculateAmountSpentThisMonth(List<PurchaseModel> purchases, int month) {
    double amountSpentToday = 0;
    for (var purchase in purchases) {
      DateTime dayPurchased = purchase.datePurchased;
      if (dayPurchased.month == month) {
        amountSpentToday += purchase.cost;
      }
    }
    return amountSpentToday;
  }

  calculateAmountSpentByCategory(List<PurchaseModel> purchases, String category) {
    double amountSpentByCategory = 0;
    for (var purchase in purchases) {
      String compareCategory = purchase.category;
      if (compareCategory == category) {
        amountSpentByCategory += purchase.cost;
      }
    }
    return amountSpentByCategory;
  }
}