// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Models/notifications.dart';
import 'package:jobsque/providers/notification_provider.dart';

final notificationProvider = ChangeNotifierProvider<NotificationProvider>(
    (ref) => NotificationProvider());

class Notifications extends StatelessWidget {
  Notifications({super.key});
  NotificationModel not = NotificationModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
      ),
      body: Consumer(builder: (context, ref, _) {
        final notificationChange = ref.watch(notificationProvider);
        return FutureBuilder(
          future: Future.delayed(Duration.zero, () async {
            not = await notificationChange.getAllNotifications();
          }),
          builder: (context, snapshot) {
            if (not.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  NotificationItem(
                    item: not,
                  ),
                ],
              );
            }
          },
        );
      }),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.item,
  });
  final NotificationModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.email_rounded),
      title: Text(item.data!.compName ?? ""),
      subtitle: Text(item.data!.lastMassage ?? ""),
      trailing: const Text("10.00"),
    );
  }
}
