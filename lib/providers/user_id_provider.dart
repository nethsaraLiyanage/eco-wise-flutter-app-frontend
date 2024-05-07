import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserIdNotifier extends StateNotifier<String> {
  UserIdNotifier() : super('test Id');

  void setUserId(String userId) {
    state = userId;
  }
}

final userIdProvider = StateNotifierProvider<UserIdNotifier, String>(
  (ref) => UserIdNotifier(),
);
