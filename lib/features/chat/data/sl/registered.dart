import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../repo_impl/chat_repo_impl.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  ChatRepositoryImpl get chatRepository => ChatRepositoryImpl(firestore: firestore);
}
