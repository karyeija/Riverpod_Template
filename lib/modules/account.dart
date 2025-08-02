import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple authentication state provider
final authProvider = StateProvider<bool>((ref) => false);

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(
        child:
            isAuthenticated
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Welcome, you are logged in!'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          () => ref.read(authProvider.notifier).state = false,
                      child: const Text('Logout'),
                    ),
                  ],
                )
                : AuthForm(),
      ),
    );
  }
}

class AuthForm extends ConsumerStatefulWidget {
  const AuthForm({super.key});

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Simulate authentication
      ref.read(authProvider.notifier).state = true;
      // Use the _email and _password fields (for demonstration, print them)
      debugPrint('User logged in with email: $_email and password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => _email = value,
              validator:
                  (value) =>
                      value != null && value.contains('@')
                          ? null
                          : 'Enter a valid email',
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => _password = value,
              validator:
                  (value) =>
                      value != null && value.length >= 6
                          ? null
                          : 'Password too short',
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
