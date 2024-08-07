import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_garden/features/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_garden/features/models/user_model.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double containerOffset = 0;
  late FocusNode userNameFocusNode;
  late FocusNode textFocusNode;
  late FocusNode pwFocusNode;
  late FocusNode confirmpwFocusNode;
  late double titleOpacity;
  late bool isSignUp;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _pwMatchController = TextEditingController();
  final AuthServices _auth = AuthServices();

  @override
  void initState() {
    super.initState();
    userNameFocusNode = FocusNode();
    textFocusNode = FocusNode();
    pwFocusNode = FocusNode();
    confirmpwFocusNode = FocusNode();

    titleOpacity = 1;
    isSignUp = false;

    userNameFocusNode.addListener(_handleFocus);
    textFocusNode.addListener(_handleFocus);
    pwFocusNode.addListener(_handleFocus);
    confirmpwFocusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    setState(() {
      if (isSignUp) {
        containerOffset = (userNameFocusNode.hasFocus || textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? -275 : -50;
      }
      else {
        containerOffset = (textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? -150 : 0;
      }
      titleOpacity = (textFocusNode.hasFocus || pwFocusNode.hasFocus || confirmpwFocusNode.hasFocus) ? 0 : 1;
    });
  }

  @override
  void dispose() {
    textFocusNode.dispose();
    pwFocusNode.dispose();
    confirmpwFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.65, 0.65 , 1.0],
            colors: [Color(0xFF58E47F), Color(0xFF58E47F) ,Colors.white, Colors.white],
          )
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: titleOpacity,
                      child: Text('Digital\nGarden', textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                    SizedBox(height: 90),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(0, containerOffset, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Visibility(
                            visible: isSignUp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text("Username", style: TextStyle(
                                  color: Color(0xF22F2F2F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                                TextField (
                                  focusNode: userNameFocusNode,
                                  controller: _userNameController,
                                ),
              
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Email", style: TextStyle(
                            color: Color(0xF22F2F2F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                          TextField(
                            focusNode: textFocusNode,
                            controller: _emailController,
                          ),
                          SizedBox(height: 10),
                          Text("Password", style: TextStyle(
                            color: Color(0xF22F2F2F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                          TextField(
                            obscureText: true,
                            focusNode: pwFocusNode,
                            controller: _passwordController,
                          ),
                          Visibility(
                            visible: isSignUp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text("Confirm Password", style: TextStyle(
                                  color: Color(0xF22F2F2F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                                TextField(
                                  obscureText: true,
                                  focusNode: confirmpwFocusNode,
                                  controller: _pwMatchController,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (isSignUp) {
                                _signUp();
                              }
                              else {
                                _signIn();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                            ),
                            child: Text("Sign ${isSignUp ? 'up' : 'in'}"),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(0, containerOffset, 0),
                      child: TextButton(onPressed: () {
                        setState(() {
                          isSignUp = !isSignUp;
                        });
                      },
                        child: Text("Sign ${isSignUp ? 'in' : 'up'}", style: TextStyle(color: Color(0xF22F2F2F)))
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signIn(email, password);

    if (user == null) {
      print("Error occurred");
      return;
    }

    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('user').doc(user.uid).get();

    if (!userSnapshot.exists) {
      print('User data not found in Firestore Database');
      return;
    }

    UserModel userModel = _createUserModel(user, userSnapshot);
    BudgetModel? budgetModel = await _fetchBudget(userModel);

    if (budgetModel == null) {
      print("Failed to fetch budget");
      return;
    }

    List<PurchaseModel> purchaseList = await _fetchPurchases(userModel);

    Navigator.pushNamed(context, "/main_menu", arguments: {
      'userModel': userModel,
      'budgetModel': budgetModel,
      'purchaseList': purchaseList,
    });
    _emailController.clear();
    _passwordController.clear();
  }

  UserModel _createUserModel(User user, DocumentSnapshot userSnapshot) {
    return UserModel(
        uid: user.uid,
        username: userSnapshot['username'],
        treeLevel: userSnapshot['treeLevel'],
        streak: userSnapshot['streak'].toDate(),
        isTreeAlive: userSnapshot['isTreeAlive'],
        lastLoginDate: userSnapshot['lastLoginDate'].toDate()
    );
  }

  void _signUp() async {
    String userName = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String pwMatch = _pwMatchController.text;

    if (password != pwMatch) {
      print("Passwords do not match");
      return;
    }

    User? user = await _auth.signUp(email, password);
    if (user == null) {
      print("Error occurred when retrieving user");
      return;
    }

    await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      'username': userName,
      'treeLevel': 1,
      'streak': Timestamp.now(),
      'isTreeAlive': true,
      'lastLoginDate': Timestamp.now(),
    });
    UserModel userModel = UserModel(
      uid: user.uid,
      username: userName,
      treeLevel: 1,
      streak: DateTime.now(),
      isTreeAlive: true,
      lastLoginDate: DateTime.now(),
    );

    BudgetModel? budgetModel = await _fetchBudget(userModel);
    List<PurchaseModel> purchaseList = [];

    await FirebaseFirestore.instance.collection('ids').doc(user.uid).set({
      'newGoalID': 0,
      'newPurchaseID': 0,
    });

    if (budgetModel == null) {
      print("Failed to fetch budget");
      return;
    }

    Navigator.pushNamed(context, "/main_menu", arguments: {
      'userModel': userModel,
      'budgetModel': budgetModel,
      'purchaseList': purchaseList,
    });
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _pwMatchController.clear();
  }

  _fetchBudget(UserModel userModel) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('budget').doc(userModel.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> budgetData = documentSnapshot.data() as Map<String, dynamic>;
        double totalAmount = budgetData['totalAmount'];
        return BudgetModel(uid: userModel.uid, totalAmount: totalAmount);
      }
      else {
        FirebaseFirestore.instance.collection('budget').doc(userModel.uid).set({
          'totalAmount': 100.0,
        });
        return BudgetModel(uid: userModel.uid, totalAmount: 100.0);
      }
    }
    catch (e) {
      print('error occurred whilst fetching the budget');
      print(e.toString());
    }
  }
  
  _fetchPurchases(UserModel userModel) async {
    try {
      QuerySnapshot<Map<String, dynamic>> purchaseQuerySnapshot = await FirebaseFirestore.instance.collection('purchase').get();
      List<PurchaseModel> dataList = [];

      for (var doc in purchaseQuerySnapshot.docs) {
        if (doc['userID'] == userModel.uid) {
          PurchaseModel purchaseModel = PurchaseModel(
            uid: userModel.uid,
            purchaseID: doc['purchaseID'],
            purchaseName: doc['purchaseName'],
            category: doc['category'],
            cost: doc['cost'],
            datePurchased: doc['date'].toDate()
          );
          dataList.add(purchaseModel);
        }
      }
      return dataList;
    }
    catch (e) {
      print("error fetching the user's purchases");
      print(e.toString());
    }
  }
}
