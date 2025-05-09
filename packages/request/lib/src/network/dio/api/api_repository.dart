import 'package:dio/dio.dart';
import 'package:models/models.dart';

import '../../../../request.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider(DioClient(Dio()));

  Future<ActionsListsForUsers> getActionsListsForUsers(
          {required String token}) =>
      _apiProvider
          .getActionsListsForUsers(
            token: token,
          )
          .then((list) => list.first);
}
