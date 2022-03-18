import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? name;
  String? place;
  String? emailid;

  UserModel({this.uid, this.name, this.emailid, this.place});


  //Receiving data from server

  factory UserModel.fromMap(map){
    return UserModel(
        emailid: map['email'],
        name: map['name'],
        place: map['place'],
        uid: map['userid']
    );
  }

// Sending data to server

  Map <String, dynamic> toMap() {
    return {
      'email': emailid,
      'name': name,
      'place': place,
      'userid': uid,
      'role':'user'
    };
  }
}