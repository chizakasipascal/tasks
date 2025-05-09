import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:models/models.dart';
import '../../../../request.dart';

class ApiProvider {
  final DioClient _dioClient;

  ApiProvider(this._dioClient);

  Future<List<ActionsListsForUsers>> getActionsListsForUsers(
      {required String token}) async {
    try {
      final result = await _dioClient.get(
        url: "${EndPoint.actionPoints}",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "x-environment": EndPoint.env,
            "cookie": "$token",
            "Accept": "application/json",
          },
        ),
      );
      final data = ActionsListsForUsers.fromJson(result).data;
      if (data != null && data is List) {
        return (data as List)
            .map((item) => ActionsListsForUsers.fromJson(item))
            .toList();
      } else {
        throw Exception("Data is null or not a list");
      }
    } catch (e) {
      debugPrint("ERROR getCommissions : ${e.toString()}");
      rethrow;
    }
  }
}
