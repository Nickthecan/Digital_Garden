import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class UserModel {
  late final String uid;
  late final String username;
  late int treeLevel;
  late DateTime streak;


  UserModel({ required this.uid, required this.username, required this.treeLevel, required this.streak});

  calculateTreeStatus(BudgetModel budgetModel, List<PurchaseModel> purchases) {
    String typeOfTree = "tree";
    if (budgetModel.calculateAmountSpentThisMonth(purchases, DateTime.now().month) > budgetModel.totalAmount) {
      typeOfTree = 'dead';
    }

    int streakTime = calculateStreak(streak);
    if (streakTime > 30) {
      return '${typeOfTree}5.png';
    }
    else if (streakTime > 20) {
      return '${typeOfTree}4.png';
    }
    else if (streakTime > 10) {
      return '${typeOfTree}3.png';
    }
    else if (streakTime > 5) {
      return '${typeOfTree}2.png';
    }
    else {
      return '${typeOfTree}1.png';
    }

  }

  calculateStreak(DateTime streak) {
    Duration onFire = DateTime.now().difference(streak);
    return onFire.inDays;
  }

  resetStreak() async {
    streak = DateTime.now();
    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'streak': Timestamp.now(),
    });
  }



}