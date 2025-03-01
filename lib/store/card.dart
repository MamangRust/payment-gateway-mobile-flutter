import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/services/card.dart';
import 'package:mobile/store/auth.dart';

class CardState {
  final bool isLoading;
  final dynamic dashboardData;
  final dynamic monthlyBalance;
  final dynamic yearlyBalance;
  final dynamic cardNumber;
  final dynamic monthlyTopupAmount;
  final dynamic yearlyTopupAmount;
  final dynamic monthlyWithdrawAmount;
  final dynamic yearlyWithdrawAmount;
  final dynamic monthlyTransactionAmount;
  final dynamic yearlyTransactionAmount;
  final dynamic monthlyTransferSenderAmount;
  final dynamic monthlyTransferReceiverAmount;
  final dynamic yearlyTransferSenderAmount;
  final dynamic yearlyTransferReceiverAmount;

  final String? errorMessage;

  CardState({
    required this.isLoading,
    this.dashboardData,
    this.monthlyBalance,
    this.yearlyBalance,
    this.cardNumber,
    this.monthlyTopupAmount,
    this.yearlyTopupAmount,
    this.monthlyWithdrawAmount,
    this.yearlyWithdrawAmount,
    this.monthlyTransactionAmount,
    this.yearlyTransactionAmount,
    this.monthlyTransferSenderAmount,
    this.monthlyTransferReceiverAmount,
    this.yearlyTransferSenderAmount,
    this.yearlyTransferReceiverAmount,
    this.errorMessage,
  });

  factory CardState.initial() {
    return CardState(isLoading: false);
  }

  CardState copyWith({
    bool? isLoading,
    dynamic dashboardData,
    dynamic monthlyBalance,
    dynamic yearlyBalance,
    dynamic cardNumber,
    dynamic monthlyTopupAmount,
    dynamic yearlyTopupAmount,
    dynamic monthlyWithdrawAmount,
    dynamic yearlyWithdrawAmount,
    dynamic monthlyTransactionAmount,
    dynamic yearlyTransactionAmount,
    dynamic monthlyTransferSenderAmount,
    dynamic monthlyTransferReceiverAmount,
    dynamic yearlyTransferSenderAmount,
    dynamic yearlyTransferReceiverAmount,
    String? errorMessage,
  }) {
    return CardState(
      isLoading: isLoading ?? this.isLoading,
      dashboardData: dashboardData ?? this.dashboardData,
      monthlyBalance: monthlyBalance ?? this.monthlyBalance,
      yearlyBalance: yearlyBalance ?? this.yearlyBalance,
      cardNumber: cardNumber ?? this.cardNumber,
      monthlyTopupAmount: monthlyTopupAmount ?? this.monthlyTopupAmount,
      yearlyTopupAmount: yearlyTopupAmount ?? this.yearlyTopupAmount,
      monthlyWithdrawAmount:
          monthlyWithdrawAmount ?? this.monthlyWithdrawAmount,
      yearlyWithdrawAmount: yearlyWithdrawAmount ?? this.yearlyWithdrawAmount,
      monthlyTransactionAmount:
          monthlyTransactionAmount ?? this.monthlyTransactionAmount,
      yearlyTransactionAmount:
          yearlyTransactionAmount ?? this.yearlyTransactionAmount,
      monthlyTransferSenderAmount:
          monthlyTransferSenderAmount ?? this.monthlyTransferSenderAmount,
      monthlyTransferReceiverAmount:
          monthlyTransferReceiverAmount ?? this.monthlyTransferReceiverAmount,
      yearlyTransferSenderAmount:
          yearlyTransferSenderAmount ?? this.yearlyTransferSenderAmount,
      yearlyTransferReceiverAmount:
          yearlyTransferReceiverAmount ?? this.yearlyTransferReceiverAmount,
      errorMessage: errorMessage,
    );
  }
}

class CardNotifier extends StateNotifier<CardState> {
  final CardService _cardService;
  final Ref _ref;

  CardNotifier(this._ref, this._cardService) : super(CardState.initial());

  Future<void> loadDashboard(String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data =
          await _cardService.findDashboardByCardNumber(accessToken, cardNumber);
      state = state.copyWith(dashboardData: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyBalance(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyBalanceByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlyBalance: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyBalance(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyBalanceByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlyBalance: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyTopupAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyTopupAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlyTopupAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyTopupAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyTopupAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlyTopupAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyWithdrawAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyWithdrawAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlyWithdrawAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyWithdrawAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyWithdrawAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlyWithdrawAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyTransactionAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyTransactionAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlyTransactionAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyTransactionAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyTransactionAmountByCard(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlyTransactionAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyTransferSenderAmount(
      int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyTransferSenderAmountByCard(
          accessToken, year, cardNumber);
      state =
          state.copyWith(monthlyTransferSenderAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyTransferReceiverAmount(
      int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findMonthlyTransferReceiverAmountByCard(
          accessToken, year, cardNumber);
      state =
          state.copyWith(monthlyTransferReceiverAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyTransferSenderAmount(
      int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyTransferSenderAmountByCard(
          accessToken, year, cardNumber);
      state =
          state.copyWith(yearlyTransferSenderAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyTransferReceiverAmount(
      int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findYearlyTransferReceiverAmountByCard(
          accessToken, year, cardNumber);
      state =
          state.copyWith(yearlyTransferReceiverAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadCardNumber(String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _cardService.findByCardNumber(accessToken, cardNumber);
      state = state.copyWith(cardNumber: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final cardProvider = StateNotifierProvider<CardNotifier, CardState>((ref) {
  final cardService = ref.read(cardServiceProvider);
  return CardNotifier(ref, cardService);
});
