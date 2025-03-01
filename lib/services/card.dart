import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/services/auth.dart';

class CardService {
  final Dio _dio;

  CardService(this._dio);

  Future<T> _handleRequest<T>(Future<Response> request) async {
    try {
      final response = await request;
      if (response.statusCode == 200) {
        return response.data['data'] as T;
      }
      throw Exception(response.data['message'] ?? "Request failed.");
    } catch (error) {
      if (error is DioException) {
        throw Exception(error.response?.data['message'] ?? "Request failed.");
      }
      throw Exception("An unknown error occurred.");
    }
  }

  Future<dynamic> findDashboardByCardNumber(
      String accessToken, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/dashboard/$cardNumber",
          options: Options(headers: {"Authorization": "Bearer $accessToken"})),
    );
  }

  Future<dynamic> findMonthlyBalanceByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/monthly-balance-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findYearlyBalanceByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/yearly-balance-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findMonthlyTopupAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/monthly-topup-amount-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findYearlyTopupAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/yearly-topup-amount-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findMonthlyWithdrawAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/monthly-withdraw-amount-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findYearlyWithdrawAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(
      _dio.get("/card/yearly-withdraw-amount-by-card",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {"year": year, "card_number": cardNumber}),
    );
  }

  Future<dynamic> findMonthlyTransactionAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/monthly-transaction-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearlyTransactionAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/yearly-transaction-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthlyTransferSenderAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/monthly-transfer-sender-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearlyTransferSenderAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/yearly-transfer-sender-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthlyTransferReceiverAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/monthly-transfer-receiver-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearlyTransferReceiverAmountByCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/yearly-transfer-receiver-amount-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findByCardNumber(String accessToken, String cardNumber) {
    return _handleRequest(_dio.get(
      "/card/card_number/$cardNumber",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }
}

final cardServiceProvider =
    Provider((ref) => CardService(ref.read(dioProvider)));
