import 'package:cloud_firestore/cloud_firestore.dart';

class EndOfLife {
  String? id;
  String itemName;
  String userId;
  String category;
  String eol;
  String yearOfPurchase;
  String brandName;

  EndOfLife({
    this.id,
    required this.itemName,
    required this.userId,
    required this.category,
    required this.eol,
    required this.yearOfPurchase,
    required this.brandName,
  });

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'userId': userId,
      'category': category,
      'eol': eol,
      'yearOfPurchase': yearOfPurchase,
      'brandName': brandName,
    };
  }

  // get a single EndOfLife object from firebase document
  static EndOfLife fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return EndOfLife(
      itemName: snapshot['itemName'],
      userId: snapshot['userId'],
      category: snapshot['category'],
      eol: snapshot['eol'],
      yearOfPurchase: snapshot['yearOfPurchase'],
      brandName: snapshot['brandName'],
    );
  }

  // parse the object from firebase document to EndOfLife object
  static List<EndOfLife> fromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => EndOfLife.fromDocumentSnapshot(e)).toList();
  }
}
