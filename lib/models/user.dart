import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/enums/user_type.dart';

class UserModel {
  String userId;
  String email;
  String name;
  String profileUrl;
  UserType userType;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.profileUrl,
    this.userType = UserType.individual,
  });

  // HashMap to save to firebase
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "profileUrl": profileUrl,
      "userType": AuthController.getUserTypeStr(userType),
    };
  }

  // get a single User from a firebase document
  static UserModel fromDocument(DocumentSnapshot snapshot) {
    return UserModel(
      userId: snapshot['userId'],
      email: snapshot['email'],
      name: snapshot['name'],
      profileUrl: snapshot['profileUrl'],
      userType: AuthController.getUserType(snapshot['userType']),
    );
  }

  // list of User from a firebase collection
  static List<UserModel> fromQuerySnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((document) => UserModel.fromDocument(document))
        .toList();
  }
}
