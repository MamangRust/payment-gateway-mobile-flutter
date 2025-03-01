import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/transfer/create.dart';
import 'package:mobile/domain/requests/transfer/update.dart';
import 'package:mobile/services/auth.dart';

class TransferService {
  final Dio _dio;

  TransferService(this._dio);

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

  Future<dynamic> findMonthStatusSuccessByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/month-success-by-card",
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
      "/transfers/year-success-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthStatusFailedByCardNumber(
      String accessToken, int year, int month, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/month-failed-by-card",
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
      "/transfers/year-failed-by-card",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTransferAmountBySender(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/monthly-by-sender",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTransferAmountBySender(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/yearly-by-sender",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findMonthTransferAmountByReceiver(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/monthly-by-receiver",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findYearTransferAmountByReceiver(
      String accessToken, int year, String cardNumber) {
    return _handleRequest(_dio.get(
      "/transfers/yearly-by-receiver",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      queryParameters: {"year": year, "card_number": cardNumber},
    ));
  }

  Future<dynamic> findByIdTransfer(String accessToken, String id) {
    return _handleRequest(_dio.get(
      "/transfers/$id",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> createTransfer(String accessToken, CreateTransfer req) {
    return _handleRequest(_dio.post(
      "/transfers/create",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }

  Future<dynamic> updateTransfer(String accessToken, UpdateTransfer req) {
    return _handleRequest(_dio.post(
      "/transfers/update",
      data: req,
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    ));
  }
}

final transferServiceProvider =
    Provider((ref) => TransferService(ref.read(dioProvider)));
