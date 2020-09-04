import 'dart:async';

abstract class AppMethods {
  Future<bool> loginUser({String email, String password});
  Future<bool> createUserAccount(
      {String name, String email, String password, String phone});
}
