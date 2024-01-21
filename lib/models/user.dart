import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String email;
  String name;
  String profileUrl;
  String userType;

  User({
    required this.userId,
    required this.email,
    required this.name,
    required this.profileUrl,
    this.userType = "user",
  });

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "profileUrl": profileUrl,
      "userType": userType,
    };
  }

  // get a single User from a firebase document
  static User fromDocument(DocumentSnapshot snapshot) {
    return User(
      userId: snapshot['userId'],
      email: snapshot['email'],
      name: snapshot['name'],
      profileUrl: snapshot['profileUrl'],
      userType: snapshot['userType'],
    );
  }

  // list of User from a firebase collection
  static List<User> fromQuerySnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((document) => User.fromDocument(document))
        .toList();
  }
}
