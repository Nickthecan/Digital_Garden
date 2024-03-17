class PurchaseModel {
  late final String uid;
  late final int purchaseID;
  late String category;
  late double cost;
  late DateTime datePurchased;

  PurchaseModel( {required this.uid, required this.purchaseID, required this.category, required this.cost, required this.datePurchased} );
}