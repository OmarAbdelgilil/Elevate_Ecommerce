import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<String> listenToOrderStatus(String orderId) {
    return _firestore.collection('orders').doc(orderId).snapshots().map(
          (snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          return snapshot.data()?['status'] ?? 'pending';
        }
        return 'pending';
      },
    );
  }

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    await _firestore.collection('orders').doc(orderId).update({
      'status': newStatus,
    });
  }
}
