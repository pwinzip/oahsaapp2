import 'package:cloud_firestore/cloud_firestore.dart';

class RoomDataRepository {
  final CollectionReference roomCollection =
      FirebaseFirestore.instance.collection("Rooms");

  Future<QuerySnapshot> getRoom() {
    return roomCollection.get();
  }
}
