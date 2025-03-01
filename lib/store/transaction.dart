import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/transaction/create.dart';
import 'package:mobile/domain/requests/transaction/update.dart';
import 'package:mobile/services/transaction.dart';
import 'package:mobile/store/auth.dart';

class TransactionState {
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

  TransactionState({
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

  factory TransactionState.initial() {
    return TransactionState(isLoading: false);
  }

  TransactionState copyWith({
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
    return TransactionState(
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

class TransactionNotifier extends StateNotifier<TransactionState> {
  final TransactionService _transactionService;
  final Ref _ref;

  TransactionNotifier(this._ref, this._transactionService)
      : super(TransactionState.initial());

  Future<void> loadMonthlySuccess(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transactionService.findMonthStatusSuccessByCardNumber(
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
      final data = await _transactionService.findYearStatusSuccessByCardNumber(
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
      final data = await _transactionService.findMonthStatusFailedByCardNumber(
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
      final data = await _transactionService.findYearStatusFailedByCardNumber(
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
      final data = await _transactionService.findMonthTransactionMethodCard(
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
      final data = await _transactionService.findYearTransactionMethodCard(
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
      final data = await _transactionService.findMonthTransactionAmountCard(
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
      final data = await _transactionService.findYearTransactionAmountCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> createTransaction(CreateTransaction req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _transactionService.createTransaction(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateTransaction(String id, UpdateTransaction req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _transactionService.updateTransaction(accessToken, id, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, TransactionState>((ref) {
  final transactionService = ref.read(transactionServiceProvider);

  return TransactionNotifier(ref, transactionService);
});
