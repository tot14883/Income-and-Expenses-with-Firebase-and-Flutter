import 'package:injectable/injectable.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

/// this is a wrapper class for FirebaseFirebaseDatabase.
@Singleton()
class FirebaseStoreDatabase {
  FirebaseFirestore get _firebaseDatabase => FirebaseFirestore.instance;

  CollectionReference collection(String table) {
    return _firebaseDatabase.collection(table);
  }
}
