import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class BudgetModel {
  late final String uid;
  late double totalAmount;

  BudgetModel( {required this.uid, required this.totalAmount} );

  updateBudget(UserModel userModel, double newBudget) async {
    totalAmount = newBudget;

    try {
      await FirebaseFirestore.instance.collection('budget').doc(userModel.uid).update({
        'totalAmount': newBudget,
      });
      print("Budget's total amount has been updated in the DB");
    }
    catch (e) {
      print('Could not Access the DB to update the total Amount');
      print(e.toString());
    }
  }

  calculateAmountRemaining(List<PurchaseModel> purchases) {
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
    double amountSpentThisMonth = 0;
    for (var purchase in purchases) {
      DateTime dayPurchased = purchase.datePurchased;
      if (dayPurchased.month == month) {
        amountSpentThisMonth += purchase.cost;
      }
    }
    return amountSpentThisMonth;
  }

  calculateAmountSpentByCategory(List<PurchaseModel> purchases, String category, int month) {
    double amountSpentByCategory = 0;
    for (var purchase in purchases) {
      String compareCategory = purchase.category;
      DateTime dayPurchased = purchase.datePurchased;
      if (compareCategory == category && dayPurchased.month == month) {
        amountSpentByCategory += purchase.cost;
      }
    }
    return amountSpentByCategory;
  }
}