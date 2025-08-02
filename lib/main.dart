import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/modules/custom_drawer.dart';
import 'package:riverpod_template/modules/helpers.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Define providers
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(31, 116, 47, 95),
        ),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.light(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pageHeight = UIHelpers.pageHeight(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
            fontSize: pageHeight * 0.09,
            color: Colors.deepPurpleAccent,
            fontFamily: 'Piazzolla',
            fontFeatures: const [FontFeature.ordinalForms()],
          ),
        ),
      ),
      body: const Center(),
    );
  }
}
