import 'package:flutter/material.dart';
import 'package:riverpod_template/modules/account.dart';
import 'package:riverpod_template/modules/notifications.dart';
import 'package:riverpod_template/modules/privacy.dart';
import 'package:riverpod_template/screens/about.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                ),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PrivacyPage()),
                ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap:
                () => showGeneralDialog(
                  context: context,
                  pageBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                  ) {
                    return AboutPage();
                  },
                ),
          ),
        ],
      ),
    );
  }
}
