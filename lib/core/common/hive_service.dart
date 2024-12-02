import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String userBoxName = 'userBox';

  Future<void> saveUser(String token, UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(token, user);
    final cachedUser = box.get(token);
    print('User saved in Hive for token $token: ${cachedUser?.toJson()}');
  }

  Future<UserModel?> getUser(String token) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    final user = box.get(token);
    await box.close();
    return user;
  }

  Future<void> clearUser(String token) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.delete(token);
    print('User data cleared for token $token');
  }

  Future<void> clearAllUsers() async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.clear();
    print('All user data cleared');
  }
}
