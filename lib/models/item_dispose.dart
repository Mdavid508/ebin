import 'package:cloud_firestore/cloud_firestore.dart';

class ItemDispose {
  String userId;
  String itemName;
  double? collectionPointLat;
  double? collectionPointLng;
  String? collectionPointName;
  String category;
  String brandName;
  List<String>? imageUrls;

  ItemDispose({
    required this.userId,
    required this.itemName,
    required this.category,
    required this.brandName,
    this.collectionPointLat,
    this.collectionPointLng,
    this.collectionPointName,
    this.imageUrls,
  });

  set setImageUrls(List<String> imageUrls) {
    this.imageUrls = imageUrls;
  }

  set setCollectionPointLat(double collectionPointLat) {
    this.collectionPointLat = collectionPointLat;
  }

  set setCollectionPointLng(double collectionPointLng) {
    this.collectionPointLng = collectionPointLng;
  }

  set setCollectionPointName(String collectionPointName) {
    this.collectionPointName = collectionPointName;
  }

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "itemName": itemName,
      "collectionPointLat": collectionPointLat,
      "collectionPointLng": collectionPointLng,
      "collectionPointName": collectionPointName,
      "category": category,
      "brandName": brandName,
      "imageUrls": imageUrls,
    };
  }

  // get a single Item from firebase document
  static ItemDispose fromDocument(DocumentSnapshot snapshot) {
    return ItemDispose(
      userId: snapshot['userId'],
      itemName: snapshot['itemName'],
      collectionPointLat: snapshot['collectionPointLat'],
      collectionPointLng: snapshot['collectionPointLng'],
      collectionPointName: snapshot['collectionPointName'],
      category: snapshot['category'],
      brandName: snapshot['brandName'],
      imageUrls: snapshot['imageUrls'],
    );
  }

  //  get a list of Item from a collection of items
  static List<ItemDispose> fromQuerySnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((item) => ItemDispose.fromDocument(item))
        .toList();
  }
}
