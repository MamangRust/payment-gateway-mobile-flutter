import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/withdraw/create.dart';
import 'package:mobile/domain/requests/withdraw/update.dart';
import 'package:mobile/services/withdraw.dart';
import 'package:mobile/store/auth.dart';

class WithdrawState {
  final bool isLoading;
  final dynamic monthlySuccess;
  final dynamic yearlySuccess;
  final dynamic monthlyFailed;
  final dynamic yearlyFailed;
  final dynamic monthlyAmount;
  final dynamic yearlyAmount;
  final String? errorMessage;

  WithdrawState({
    required this.isLoading,
    this.monthlySuccess,
    this.yearlySuccess,
    this.monthlyFailed,
    this.yearlyFailed,
    this.monthlyAmount,
    this.yearlyAmount,
    this.errorMessage,
  });

  factory WithdrawState.initial() {
    return WithdrawState(isLoading: false);
  }

  WithdrawState copyWith({
    bool? isLoading,
    dynamic monthlySuccess,
    dynamic yearlySuccess,
    dynamic monthlyFailed,
    dynamic yearlyFailed,
    dynamic monthlyAmount,
    dynamic yearlyAmount,
    String? errorMessage,
  }) {
    return WithdrawState(
      isLoading: isLoading ?? this.isLoading,
      monthlySuccess: monthlySuccess ?? this.monthlySuccess,
      yearlySuccess: yearlySuccess ?? this.yearlySuccess,
      monthlyFailed: monthlyFailed ?? this.monthlyFailed,
      yearlyFailed: yearlyFailed ?? this.yearlyFailed,
      monthlyAmount: monthlyAmount ?? this.monthlyAmount,
      yearlyAmount: yearlyAmount ?? this.yearlyAmount,
      errorMessage: errorMessage,
    );
  }
}

class WithdrawNotifier extends StateNotifier<WithdrawState> {
  final WithdrawService _withdrawService;
  final Ref _ref;

  WithdrawNotifier(this._ref, this._withdrawService)
      : super(WithdrawState.initial());

  Future<void> loadMonthlySuccess(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _withdrawService.findMonthStatusSuccessByCardNumber(
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
      final data = await _withdrawService.findYearStatusSuccessByCardNumber(
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
      final data = await _withdrawService.findMonthStatusFailedByCardNumber(
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
      final data = await _withdrawService.findYearStatusFailedByCardNumber(
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
      final data = await _withdrawService.findMonthWithdrawAmountCard(
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
      final data = await _withdrawService.findYearWithdrawAmountCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> createWithdraw(CreateWithdraw req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _withdrawService.createWithdraw(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateWithdraw(String id, UpdateWithdraw req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _withdrawService.updateWithdraw(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final withdrawProvider =
    StateNotifierProvider<WithdrawNotifier, WithdrawState>((ref) {
  final withdrawService = ref.read(withdrawServiceProvider);

  return WithdrawNotifier(ref, withdrawService);
});
