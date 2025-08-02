import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example notifications list
    final notifications = [
      'Your order has been shipped!',
      'New message from support.',
      'Weekly summary is ready.',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body:
          notifications.isEmpty
              ? const Center(child: Text('No notifications'))
              : ListView.separated(
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(notifications[index]),
                  );
                },
              ),
    );
  }
}
