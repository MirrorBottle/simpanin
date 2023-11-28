import 'dart:async';
import 'dart:convert';
import 'package:simpanin/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simpanin/services/user_service.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthService {
  // ignore: prefer_final_fields
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static get user => null;

  static Future<void> signUp(UserModel data) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password!);
      String auth = json.encode(data.toMap());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth', auth);
      await UserService.updateUser(user);
    } catch (e) {}
  }

  static Future<void> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel user = await UserService.getUser(result.user!.uid);
      String auth = json.encode(user.toMap());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth', auth);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> refetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedAuth = prefs.getString('auth') ?? "{}";
    UserModel curUser = UserModel.fromJson(json.decode(encodedAuth));
    UserModel user = await UserService.getUser(curUser.id);
    String auth = json.encode(user.toMap());
    prefs.setString('auth', auth);
  }

  static Future<UserModel> auth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedAuth = prefs.getString('auth') ?? "{}";
    return UserModel.fromJson(json.decode(encodedAuth));
  }

}