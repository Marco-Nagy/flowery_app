import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:injectable/injectable.dart';
  @singleton
  @injectable
class FireStoreService {
  static final FireStoreService _instance = FireStoreService._();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  factory FireStoreService() {
    return _instance;
  }

  FireStoreService._();

  FirebaseFirestore get fireStore => _fireStore;
  FirebaseDatabase get firebaseDatabase => _firebaseDatabase;
}