import 'package:cloud_firestore/cloud_firestore.dart';

class CollectorSale {
  String collectorId;
  String dismantlerId;
  double lat, lng;
  String collectorsName;
  String dismantlingPointName;
  DateTime dateOfVisit;

  CollectorSale({
    required this.collectorId,
    required this.dismantlerId,
    required this.lat,
    required this.lng,
    required this.collectorsName,
    required this.dismantlingPointName,
    required this.dateOfVisit,
  });

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      'collectorId': collectorId,
      'dismantlerId': dismantlerId,
      'lat': lat,
      'lng': lng,
      'collectorsName': collectorsName,
      'dismantlingPoint': dismantlingPointName,
      'dateOfVisit': Timestamp.fromDate(dateOfVisit),
    };
  }

  // get a single EndOfLife object from firebase document
  static CollectorSale fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return CollectorSale(
      collectorId: snapshot['collectorId'],
      dismantlerId: snapshot['dismantlerId'],
      lat: snapshot['lat'],
      lng: snapshot['lng'],
      collectorsName: snapshot['collectorsName'],
      dismantlingPointName: snapshot['dismantlingPoint'],
      dateOfVisit: snapshot['dateOfVisit'].toDate(),
    );
  }

  // parse the object from firebase document to Collectors saleobject object
  static List<CollectorSale> fromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((e) => CollectorSale.fromDocumentSnapshot(e))
        .toList();
  }
}
