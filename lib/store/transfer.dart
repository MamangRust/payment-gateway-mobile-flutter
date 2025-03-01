import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/transfer/create.dart';
import 'package:mobile/domain/requests/transfer/update.dart';
import 'package:mobile/services/transfer.dart';
import 'package:mobile/store/auth.dart';

class TransferState {
  final bool isLoading;
  final dynamic monthlySuccess;
  final dynamic yearlySuccess;
  final dynamic monthlyFailed;
  final dynamic yearlyFailed;
  final dynamic transfer;
  final dynamic monthlyMethods;
  final dynamic yearlyMethods;
  final dynamic monthlySenderAmount;
  final dynamic yearlySenderAmount;
  final dynamic monthlyReceiverAmount;
  final dynamic yearlyReceiverAmount;
  final String? errorMessage;

  TransferState({
    required this.isLoading,
    this.monthlySuccess,
    this.yearlySuccess,
    this.monthlyFailed,
    this.yearlyFailed,
    this.transfer,
    this.monthlyMethods,
    this.yearlyMethods,
    this.monthlySenderAmount,
    this.yearlySenderAmount,
    this.monthlyReceiverAmount,
    this.yearlyReceiverAmount,
    this.errorMessage,
  });

  factory TransferState.initial() {
    return TransferState(isLoading: false);
  }

  TransferState copyWith({
    bool? isLoading,
    dynamic monthlySuccess,
    dynamic yearlySuccess,
    dynamic monthlyFailed,
    dynamic yearlyFailed,
    dynamic transfer,
    dynamic monthlyMethods,
    dynamic yearlyMethods,
    dynamic monthlySenderAmount,
    dynamic yearlySenderAmount,
    dynamic monthlyReceiverAmount,
    dynamic yearlyReceiverAmount,
    String? errorMessage,
  }) {
    return TransferState(
      isLoading: isLoading ?? this.isLoading,
      monthlySuccess: monthlySuccess ?? this.monthlySuccess,
      yearlySuccess: yearlySuccess ?? this.yearlySuccess,
      monthlyFailed: monthlyFailed ?? this.monthlyFailed,
      yearlyFailed: yearlyFailed ?? this.yearlyFailed,
      transfer: transfer ?? this.transfer,
      monthlyMethods: monthlyMethods ?? this.monthlyMethods,
      yearlyMethods: yearlyMethods ?? this.yearlyMethods,
      monthlySenderAmount: monthlySenderAmount ?? this.monthlySenderAmount,
      yearlySenderAmount: yearlySenderAmount ?? this.yearlySenderAmount,
      monthlyReceiverAmount:
          monthlyReceiverAmount ?? this.monthlyReceiverAmount,
      yearlyReceiverAmount: yearlyReceiverAmount ?? this.yearlyReceiverAmount,
      errorMessage: errorMessage,
    );
  }
}

class TransferNotifier extends StateNotifier<TransferState> {
  final TransferService _transferService;
  final Ref _ref;

  TransferNotifier(this._ref, this._transferService)
      : super(TransferState.initial());

  Future<void> loadMonthlySuccess(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findMonthStatusSuccessByCardNumber(
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
      final data = await _transferService.findYearStatusSuccessByCardNumber(
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
      final data = await _transferService.findMonthStatusFailedByCardNumber(
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
      final data = await _transferService.findYearStatusFailedByCardNumber(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlySenderAmount(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findMonthTransferAmountBySender(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlySenderAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlySenderAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findYearTransferAmountBySender(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlySenderAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadMonthlyReceiverAmount(
      int year, int month, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findMonthTransferAmountByReceiver(
          accessToken, year, cardNumber);
      state = state.copyWith(monthlyReceiverAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadYearlyReceiverAmount(int year, String cardNumber) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findYearTransferAmountByReceiver(
          accessToken, year, cardNumber);
      state = state.copyWith(yearlyReceiverAmount: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> loadTransfer(String id) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final data = await _transferService.findByIdTransfer(accessToken, id);
      state = state.copyWith(yearlySuccess: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> createTransfer(CreateTransfer req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _transferService.createTransfer(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateTransfer(String id, UpdateTransfer req) async {
    final accessToken = _ref.read(authProvider).accessToken;
    if (accessToken == null) {
      state = state.copyWith(errorMessage: "Unauthorized");
      return;
    }

    try {
      state = state.copyWith(isLoading: true);
      await _transferService.updateTransfer(accessToken, req);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final transferProvider =
    StateNotifierProvider<TransferNotifier, TransferState>((ref) {
  final transferService = ref.read(transferServiceProvider);

  return TransferNotifier(ref, transferService);
});
