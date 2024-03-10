import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Database/local_database.dart';
import 'package:jobsque/screens/HomeScreen/home_screen.dart';
import 'package:jobsque/screens/Regsitration/create_account.dart';
import 'package:jobsque/screens/Login/login_screen.dart';

final authprovider = ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider(),
);

class AuthProvider extends ChangeNotifier {
  Future<void> login(BuildContext buildContext) async {
    final userName = emailAddressController.text;
    final password = passwordController.text;
    final dio = Dio();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/login",
      data: {"email": userName, "password": password},
      options: Options(validateStatus: (_) => true),
    );
    if (response.data["status"]) {
      // ignore: use_build_context_synchronously
      Navigator.of(buildContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (buildContext) => const HomeScreen()),
          (route) => false);
      LocalDatabase.setId(response.data['user']["id"]);
      LocalDatabase.setToken(response.data["token"]);
    } else if (response.data["status"] == false) {
      String message = "";
      message = response.data["massage"];
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(buildContext).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red.shade700,
        ),
      );
      notifyListeners();
    }
  }

  Future<void> register(BuildContext buildContext) async {
    final userName = nameController.text;
    final email = emailController.text;
    final password = passController.text;
    final dio = Dio();
    final response = await dio.post(
      "https://project2.amit-learning.com/api/auth/register",
      data: {"email": email, "name": userName, "password": password},
      options: Options(validateStatus: (_) => true),
    );
    if (response.data["status"]) {
      // ignore: use_build_context_synchronously
      Navigator.of(buildContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (buildContext) => const LoginScreen()),
          (route) => false);
    } else if (response.data["status"] == false) {
      String message = "";
      if (response.data["massege"] is Map) {
        message = response.data["massege"]["email"] ??
            response.data["massege"]["password"];
      } else {
        message = response.data["massage"];
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(buildContext).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red.shade700,
        ),
      );
      notifyListeners();
    }
  }
}
