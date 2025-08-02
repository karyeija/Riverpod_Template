import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/Notifiers/navigation_notifier.dart';
import 'package:riverpod_template/Notifiers/thememode_notifier.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

// ...existing code...
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeModeNotifier = ref.read(themeModeProvider.notifier);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(31, 116, 47, 95),
        ),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      themeMode: themeMode,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Template'),
          actions: [
            IconButton(
              icon: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: themeModeNotifier.toggle,
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: const MainNavigation(),
      ),
    );
  }
}
// ...existing code...