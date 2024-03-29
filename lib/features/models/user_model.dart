import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String uid;
  late final String username;
  late int treeLevel;
  late DateTime streak;


  UserModel({ required this.uid, required this.username, required this.treeLevel, required this.streak});

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