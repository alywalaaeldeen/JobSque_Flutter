import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Database/local_database.dart';
import 'package:jobsque/Models/notifications.dart';

final notificationProvider = ChangeNotifierProvider<NotificationProvider>(
  (ref) => NotificationProvider(),
);

class NotificationProvider extends ChangeNotifier {
  Future<NotificationModel> getAllNotifications() async {
    String token = await LocalDatabase.getToken() as String;
    print("Helllooooooo");
    print(token);

    final dio = Dio();
    final response =
        await dio.get("https://project2.amit-learning.com/api/notification/1",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Connection": "keep-alive"
            }));

    if (response.data['status']) {
      final notification = NotificationModel.fromJson(response.data);

      return notification;
    }
    return NotificationModel(status: false, data: null);
  }
}
