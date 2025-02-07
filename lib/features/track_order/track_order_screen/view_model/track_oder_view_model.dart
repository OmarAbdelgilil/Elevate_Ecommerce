import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_ecommerce/features/data_intent/data_intent.dart';
import 'package:flutter/material.dart';
import '../../../chat/presentation/chat_screen/pages/view/chat_screen.dart';

class OrderViewModel extends ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  String _driverName = "";
  String get driverName => _driverName;

  final List<Map<String, String>> _steps = [
    {"title": "Pending", "timestamp": ""},
    {"title": "Accepted", "timestamp": ""},
    {"title": "Arrive Pickup Location", "timestamp": ""},
    {"title": "Arrive User Location", "timestamp": ""},
    {"title": "Completed", "timestamp": ""}
  ];
  List<Map<String, String>> get steps => _steps;

  void listenToOrder(String orderId) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        _driverName = '${data['driver']?['firstName'] ?? ""} ${data['driver']?['lastName'] ?? ""}'.trim().isEmpty ? "Unknown" : '${data['driver']?['firstName']} ${data['driver']?['lastName']}';

        DataIntent.pushDriverId(data['driver']?['_id'] ?? "");
        DataIntent.pushDriverName(_driverName);
        String status = data['status'] ?? "Pending";
        _updateStep(status);

        for (int i = 0; i < _steps.length; i++) {
          _steps[i]["timestamp"] = data[_steps[i]["title"]] ?? "";
        }

        notifyListeners();
      }
    });
  }

  void _updateStep(String status) {
    switch (status) {
      case "Pending":
        _currentStep = 0;
        break;
      case "Accepted":
        _currentStep = 1;
        break;
      case "Arrive Pickup Location":
        _currentStep = 2;
        break;
      case "Arrive User Location":
        _currentStep = 3;
        break;
      case "Completed":
        _currentStep = 4;
        break;
    }
    notifyListeners();
  }

  String generateChatId(String userId, String driverId) {
    List<String> ids = [userId, driverId];
    ids.sort();
    return ids.join("_");
  }
  void navigateToChatPage(BuildContext context, String userId, String driverId) {

    String chatId = generateChatId(userId, driverId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(chatId: chatId, senderId: userId, receiverId: driverId),
      ),
    );
  }


}
