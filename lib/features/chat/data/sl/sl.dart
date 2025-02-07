import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/chat_screen/pages/view_model/chat_view_model.dart';
import '../firestore_factory/firebase_factory.dart';

final GetIt sl = GetIt.instance;

void setup() async{

  var firestore = await FirestoreFactoryImpl().create();
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);


  sl.registerFactory<ChatViewModel>(() => ChatViewModel(
    getMessagesUseCase: sl(),
    sendMessageUseCase: sl(),
  ));
}
