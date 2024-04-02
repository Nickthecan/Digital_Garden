import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class UserModel {
  late final String uid;
  late final String username;
  late int treeLevel;
  late DateTime streak;
  late bool isTreeAlive;

  UserModel({ required this.uid, required this.username, required this.treeLevel, required this.streak, required this.isTreeAlive});

  Future<String> calculateTreeStatus(BudgetModel budgetModel, List<PurchaseModel> purchases) async {
    String typeOfTree = "tree";

    if (!isTreeAlive && DateTime.now().day == 1) {
      typeOfTree = "tree";
      isTreeAlive = true;
      streak = DateTime.now();

      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'isTreeAlive': true,
        'streak': Timestamp.now(),
        'treeLevel': 1,
      });
      return typeOfTree + (await calculateTreeLevel(budgetModel, purchases)).toString();
    }
    else if (!isTreeAlive) {
      typeOfTree = 'dead';
      return typeOfTree + (await calculateTreeLevel(budgetModel, purchases)).toString();
    }
    else if (budgetModel.calculateAmountSpentThisMonth(purchases, DateTime.now().month) > budgetModel.totalAmount) {
      typeOfTree = 'dead';
      isTreeAlive = false;

      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'isTreeAlive': false,
      });
      return typeOfTree + (await calculateTreeLevel(budgetModel, purchases)).toString();
    }
    else {
      return typeOfTree + (await calculateTreeLevel(budgetModel, purchases)).toString();
    }
  }

  Future<int> calculateTreeLevel(BudgetModel budgetModel, List<PurchaseModel> purchases) async {
    int streakTime = calculateStreak(streak);
    if (streakTime > 30) {
      treeLevel = 5;
      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'treeLevel': 5,
      });
      return treeLevel;
    }
    else if (streakTime > 20) {
      treeLevel = 4;
      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'treeLevel': 4,
      });
      return treeLevel;
    }
    else if (streakTime > 10) {
      treeLevel = 3;
      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'treeLevel': 3,
      });
      return treeLevel;
    }
    else if (streakTime > 5) {
      treeLevel = 2;
      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'treeLevel': 2,
      });
      return treeLevel;
    }
    else {
      treeLevel = 1;
      await FirebaseFirestore.instance.collection('user').doc(uid).update({
        'treeLevel': 1,
      });
      return treeLevel;
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