import 'package:cloud_firestore/cloud_firestore.dart';

class SectionDataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("Sections");

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
}
