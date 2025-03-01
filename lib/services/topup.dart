import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/topup/create.dart';
import 'package:mobile/domain/requests/topup/update.dart';
import 'package:mobile/services/auth.dart';

class TopupService {
  final Dio _dio;

  TopupService(this._dio);

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
      "/topups/monthly-success-by-card",
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
      "/topups/yearly-success-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthStatusFailedByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/topups/monthly-failed-by-card",
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
      "/topups/yearly-failed-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTopupMethodCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/topups/monthly-methods-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTopupMethodCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/topups/yearly-methods-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTopupAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/topups/monthly-amounts-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTopupAmountCard(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/topups/yearly-amounts-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> createTopup(String accessToken, CreateTopup req) {
    return _handleRequest(_dio.post(
      "/topups/create",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> updateTopup(String accessToken, String id, UpdateTopup req) {
    return _handleRequest(_dio.post(
      "/topups/update/$id",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }
}

final topupServiceProvider =
    Provider((ref) => TopupService(ref.read(dioProvider)));
