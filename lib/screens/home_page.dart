import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for a list of 20 distinct colors
final colorsProvider = Provider<List<Color>>((ref) {
  return List<Color>.generate(
    20,
    (i) => Colors.primaries[i % Colors.primaries.length].shade400,
  );
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Colors Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            alignment: Alignment.center,
            child: Text(
              'Container ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
