import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/Firestore/Models/User.dart' as UserModel;
import 'package:foodie/Firestore/Services/UserService.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<UserModel.User> {
  UserNotifier() : super(UserModel.User(id: '',access_id: '',address: '',email: '',name: '',password: '',phone_number: ''));

  void addUser(UserModel.User user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel.User>(
  (ref) => UserNotifier(),
);
