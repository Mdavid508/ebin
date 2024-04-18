import 'package:cloud_firestore/cloud_firestore.dart';

class MappingModel {
  String collectorId;
  String dismantlerId;
  String collectorName;
  String dismantlerName;
  double totalWeight;
  double pricePerKg;

  MappingModel({
    required this.collectorId,
    required this.dismantlerId,
    required this.collectorName,
    required this.dismantlerName,
    required this.totalWeight,
    required this.pricePerKg,
  });

//Hashmap to save to firebase.
  Map<String, dynamic> toMap() {
    return {
      'collectorId': collectorId,
      'dismantlerId': dismantlerId,
      'collectorName': collectorName,
      'dismantlerName': dismantlerName,
      'totalWeight': totalWeight,
      'pricePerKg': pricePerKg,
    };
  }

  // get a single User from a firebase document
  static MappingModel fromDocument(DocumentSnapshot snapshot) {
    return MappingModel(
      collectorId: snapshot['collectorId'],
      dismantlerId: snapshot['dismantlerId'],
      collectorName: snapshot['collectorName'],
      dismantlerName: snapshot['dismantlerName'],
      totalWeight: snapshot['totalWeight'],
      pricePerKg: snapshot['pricePerKg'],
    );
  }

  // list of User from a firebase collection
  static List<MappingModel> fromQuerySnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((document) => MappingModel.fromDocument(document))
        .toList();
  }
}
