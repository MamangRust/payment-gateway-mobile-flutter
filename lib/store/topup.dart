import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/topup/create.dart';
import 'package:mobile/domain/requests/topup/update.dart';
import 'package:mobile/services/topup.dart';
import 'package:mobile/store/auth.dart';

class TopupState {
  final bool isLoading;
  final dynamic monthlySuccess;
  final dynamic yearlySuccess;
  final dynamic monthlyFailed;
  final dynamic yearlyFailed;
  final dynamic monthlyMethods;
  final dynamic yearlyMethods;
  final dynamic monthlyAmount;
  final dynamic yearlyAmount;
  final String? errorMessage;

  TopupState({
    required this.isLoading,
    this.monthlySuccess,
    this.yearlySuccess,
    this.monthlyFailed,
    this.yearlyFailed,
    this.monthlyMethods,
    this.yearlyMethods,
    this.monthlyAmount,
    this.yearlyAmount,
    this.errorMessage,
  });

  factory TopupState.initial() {
    return TopupState(isLoading: false);
  }

  TopupState copyWith({
    bool? isLoading,
    dynamic monthlySuccess,
    dynamic yearlySuccess,
    dynamic monthlyFailed,
    dynamic yearlyFailed,
    dynamic monthlyMethods,
    dynamic yearlyMethods,
    dynamic monthlyAmount,
    dynamic yearlyAmount,
    String? errorMessage,
  }) {
    return TopupState(
      isLoading: isLoading ?? this.isLoading,
      monthlySuccess: monthlySuccess ?? this.monthlySuccess,
      yearlySuccess: yearlySuccess ?? this.yearlySuccess,
      monthlyFailed: monthlyFailed ?? this.monthlyFailed,
      yearlyFailed: yearlyFailed ?? this.yearlyFailed,
      monthlyMethods: monthlyMethods ?? this.monthlyMethods,
      yearlyMethods: yearlyMethods ?? this.yearlyMethods,
      monthlyAmount: monthlyAmount ?? this.monthlyAmount,
      yearlyAmount: yearlyAmount ?? this.yearlyAmount,
      errorMessage: errorMessage,
    );
  }
}

class TopupNotifier extends StateNotifier<TopupState> {
  final TopupService _topupService;
  final Ref _ref;

  TopupNotifier(this._ref, this._topupService) : super(TopupState.initial());

  Future<void> loadMonthlySuccess(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findMonthStatusSuccessByCardNumber(
          accessToken, year, month, cardNumber);
      state = state.copyWith(monthlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlySuccess(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findYearStatusSuccessByCardNumber(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyFailed(int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findMonthStatusFailedByCardNumber(
          accessToken, year, month, cardNumber);
      state = state.copyWith(monthlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyFailed(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findYearStatusFailedByCardNumber(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyMethod(int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findMonthTopupMethodCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyMethod(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findYearTopupMethodCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyAmount(int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findMonthTopupAmountCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _topupService.findYearTopupAmountCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> createTopup(CreateTopup req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _topupService.createTopup(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateTopup(String id, UpdateTopup req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _topupService.updateTopup(accessToken, id, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final topupProvider = StateNotifierProvider<TopupNotifier, TopupState>((ref) {
  final topupService = ref.read(topupServiceProvider);

  return TopupNotifier(ref, topupService);
});
