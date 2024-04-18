import 'package:cloud_firestore/cloud_firestore.dart';

class Dismantler {
  String userId;
  double lat, lng;
  String companyName;
  double pricePerKg;
  List<String> imageUrls;
  double? disposedWeight;
  double? collectedWeight;

  Dismantler({
    required this.userId,
    required this.lat,
    required this.lng,
    required this.companyName,
    required this.pricePerKg,
    required this.imageUrls,
    this.disposedWeight,
    this.collectedWeight,
  });

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "lat": lat,
      "lng": lng,
      "companyName": companyName,
      "pricePerKg": pricePerKg,
      "imageUrls": imageUrls,
      'disposedWeight': disposedWeight,
      'collectedWeight': collectedWeight,
    };
  }

  // get a single Dismantler from firebase document
  static Dismantler fromDocument(DocumentSnapshot snapshot) {
    return Dismantler(
      userId: snapshot['userId'],
      lat: snapshot['lat'],
      lng: snapshot['lng'],
      disposedWeight: snapshot['disposedWeight'],
      collectedWeight: snapshot['collectedWeight'],
      companyName: snapshot['companyName'],
      pricePerKg: snapshot['pricePerKg'],
      imageUrls: List<String>.from(
        snapshot['imageUrls'],
      ),
    );
  }

  // get a list of Dismantlers
  static List<Dismantler> fromQuerySnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((document) => Dismantler.fromDocument(document))
        .toList();
  }
}
