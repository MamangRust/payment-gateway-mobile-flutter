import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/transaction/create.dart';
import 'package:mobile/domain/requests/transaction/update.dart';
import 'package:mobile/services/auth.dart';

class TransactionService {
  final Dio _dio;

  TransactionService(this._dio);

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

  Future<dynamic> findMonthStatusSuccessByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/monthly-success-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {
        "year": year,
        "month": month,
        "card_number": cardNumber
      },
    ));
  }

  Future<dynamic> findYearStatusSuccessByCardNumber(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/yearly-success-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthStatusFailedByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/monthly-failed-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {
        "year": year,
        "month": month,
        "card_number": cardNumber
      },
    ));
  }

  Future<dynamic> findYearStatusFailedByCardNumber(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/yearly-failed-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTransactionMethodCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/monthly-methods-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTransactionMethodCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/yearly-methods-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTransactionAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/monthly-amounts-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTransactionAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/yearly-amounts-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findByIdTransaction(
      String accessToken, String transactionId) {
    return _handleRequest(_dio.get(
      "/transactions/$transactionId",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> findByCardNumberTransaction(
      String accessToken, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transactions/card-number/$cardNumber",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> createTransaction(
      String accessToken, CreateTransaction transactionData) {
    return _handleRequest(_dio.post(
      "/transactions/create",
      data: transactionData,
      options: Options(headers: {
        "Authorization": "Bearer $accessToken",
        "X-API-Key": transactionData.apiKey,
      }),
    ));
  }

  Future<dynamic> updateTransaction(String accessToken, String transactionId,
      UpdateTransaction transactionData) {
    return _handleRequest(_dio.post(
      "/transactions/update/$transactionId",
      data: transactionData,
      options: Options(headers: {
        "Authorization": "Bearer $accessToken",
        "X-API-Key": transactionData.apiKey,
      }),
    ));
  }
}

final transactionServiceProvider =
    Provider((ref) => TransactionService(ref.read(dioProvider)));
