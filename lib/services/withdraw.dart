import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/withdraw/create.dart';
import 'package:mobile/domain/requests/withdraw/update.dart';
import 'package:mobile/services/auth.dart';

class WithdrawService {
  final Dio _dio;

  WithdrawService(this._dio);

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
      throw Exception("Unexpected error occurred.");
    }
  }

  Future<dynamic> findByIdwithdraw(String accessToken, String id) {
    return _handleRequest(_dio.get(
      "/withdraws/$id",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> createWithdraw(String accessToken, CreateWithdraw req) {
    return _handleRequest(_dio.post(
      "/withdraws/create",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> updateWithdraw(String accessToken, UpdateWithdraw req) {
    return _handleRequest(_dio.post(
      "/withdraws/update",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> findMonthWithdrawAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/withdraws/monthly-amount",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearWithdrawAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/withdraws/yearly-amount",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthStatusSuccessByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/withdraws/monthly-success-by-card",
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
      "/withdraws/yearly-success-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthStatusFailedByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/withdraws/monthly-failed-by-card",
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
      "/withdraws/yearly-failed-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findByIdWithdraw(String accessToken, String id) {
    return _handleRequest(_dio.get(
      "/withdraws/$id",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> findAllByCardNumberWithdraw(
      String accessToken, String cardNumber) {
    return _handleRequest(_dio.get(
      "/withdraws/card-number/$cardNumber",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }
}

final withdrawServiceProvider =
    Provider((ref) => WithdrawService(ref.read(dioProvider)));
