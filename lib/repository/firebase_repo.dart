import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telephony/telephony.dart';

class FirebaseRepository {
  CollectionReference reference =
      FirebaseFirestore.instance.collection("messages");

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  saveSms(SmsMessage message) {
    try {
      reference
          .doc("05514325103")
          .collection(message.address.toString())
          .add({
            "message": message.body,
            "address": message.address,
            "date": message.date,
          })
          .then((value) => print(value))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {
      print(e);
    }
  }
}
