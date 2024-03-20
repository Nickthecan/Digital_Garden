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
}