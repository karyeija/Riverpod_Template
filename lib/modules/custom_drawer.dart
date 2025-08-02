import 'package:flutter/material.dart';
import 'package:riverpod_template/modules/helpers.dart';
import 'package:riverpod_template/screens/about.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // Define the icons and dimensions
    const closeIcon = 'assets/images/closeButton.png';
    final aboutIcon = 'assets/images/aboutButton.png';
    var pageHeight = UIHelpers.pageHeight(context);
    var pageWidth = UIHelpers.pageWidth(context);
    return Drawer(
      width: pageWidth * 0.6, // Set the width of the drawer
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SafeArea(
            child: SizedBox(
              height: pageHeight * 0.1,
              child: const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          ListTile(
            // tileColor: Colors.amber,
            title: const Text('About'),
            leading: Image.asset(aboutIcon, height: pageHeight * 0.08),
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

          ListTile(
            leading: Image.asset(
              closeIcon,
              // Use the close icon for the exit option',
              // width: pageWidth * 0.1,
              // height: pageHeight * 0.8,
            ),
            title: const Text('Exit'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
