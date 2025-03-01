import 'dart:async';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/auth/login.dart';
import 'package:mobile/domain/requests/auth/register.dart';
import 'package:mobile/domain/response/auth/login.dart';
import 'package:mobile/domain/response/auth/me.dart';
import 'package:mobile/domain/response/user/user.dart';
import 'package:mobile/services/auth.dart';

class AuthState {
  final bool isAuthenticated;
  final String? accessToken;
  final String? refreshToken;

  AuthState({
    required this.isAuthenticated,
    this.accessToken,
    this.refreshToken,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

class UserState {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  UserState({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  UserState copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return UserState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  final AuthService authService;
  final AuthNotifier authNotifier;

  UserNotifier(this.authService, this.authNotifier)
      : super(UserState(id: null));

  Future<void> fetchUser() async {
    try {
      if (authNotifier.state.accessToken == null) return;

      final response = await authService.getMe(authNotifier.state.accessToken!);
      state = state.copyWith(
        id: response.data?.id,
        firstName: response.data?.firstname,
        lastName: response.data?.lastname,
        email: response.data?.email,
      );
    } catch (e) {
      print("Failed to fetch user: $e");
      authNotifier.logout();
    }
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService authService;
  Timer? _refreshTokenTimer;

  AuthNotifier(this.authService) : super(AuthState(isAuthenticated: false));

  Future<void> login(LoginRequest req) async {
    try {
      final response = await authService.login(req);

      _setAuthData(response);
      _startTokenRefresh();
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> register(RegisterRequest req) async {
    try {
      await authService.register(req);
    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }

  Future<void> refreshAccessToken() async {
    if (state.refreshToken == null) return;

    try {
      final response = await authService.refreshAccessToken(
          state.accessToken ?? "", state.refreshToken!);
      state = state.copyWith(accessToken: response.data?.accessToken);
    } catch (e) {
      logout();
    }
  }

  void logout() {
    state = AuthState(isAuthenticated: false);
    _refreshTokenTimer?.cancel();
  }

  void _setAuthData(ApiResponseLogin response) {
    final newState = AuthState(
      isAuthenticated: true,
      accessToken: response.data?.accessToken,
      refreshToken: response.data?.refreshToken,
    );
    state = newState;
  }

  void _startTokenRefresh() {
    _refreshTokenTimer?.cancel();

    if (state.accessToken == null) return;

    final decodedToken = JwtDecoder.decode(state.accessToken!);
    final exp = decodedToken["exp"] * 1000;
    final now = DateTime.now().millisecondsSinceEpoch;
    final durationUntilExpiry = Duration(milliseconds: exp - now);

    if (durationUntilExpiry.inSeconds > 0) {
      _refreshTokenTimer =
          Timer(durationUntilExpiry - Duration(minutes: 1), () {
        refreshAccessToken();
      });
    } else {
      logout();
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(authServiceProvider)));

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final authNotifier = ref.watch(authProvider.notifier);
  return UserNotifier(ref.watch(authServiceProvider), authNotifier);
});
