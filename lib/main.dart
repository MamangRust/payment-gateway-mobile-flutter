import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/splash.dart';
import 'package:mobile/layout/layout_app.dart';
import 'package:mobile/pages/analytics.dart';
import 'package:mobile/pages/auth/registerpage.dart';
import 'package:mobile/pages/auth/loginpage.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: "analytics",
      path: "/analytics",
      builder: (context, state) => const AnalyticsScreen(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: "main",
      path: "/main",
      builder: (context, state) => const MainLayout(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
