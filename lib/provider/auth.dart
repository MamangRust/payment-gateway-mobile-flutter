import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/layout/layout_app.dart';
import 'package:mobile/pages/auth/login.dart';
import 'package:mobile/store/auth.dart';

class AuthGuard extends ConsumerWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final userNotifier = ref.read(userProvider.notifier);

    if (!authState.isAuthenticated) {
      return const LoginScreen();
    }

    if (authState.accessToken != null) {
      userNotifier.fetchUser();
    }

    return const MainLayout();
  }
}
