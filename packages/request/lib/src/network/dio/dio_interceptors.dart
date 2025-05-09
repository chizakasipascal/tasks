import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  DioInterceptors(this._dio);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("""--> 
                OnREQUEST[${options.method.toUpperCase()} : METHOD] 
                BASEURL =>[ ${options.baseUrl} ]
                => PATH: [${options.path}] 
              """);

    options.headers.forEach((k, v) => debugPrint('$k: $v'));

    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));

    if (options.data != null) {
      debugPrint("Body: [${options.data}]");
      debugPrint("--> END [${options.method.toUpperCase()}]");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("""-->
            OnRESPONSE[
              ${response.statusCode} 
             ResponseRequest[${response.requestOptions.baseUrl + response.requestOptions.path}] 
              ]  
            => PATH:[${response.requestOptions.path}] 
        """);

    response.headers.forEach(
      (k, v) => debugPrint("$k : $v"),
    );
    debugPrint("RESPONSE:${response.data}");
    debugPrint("END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint("""-->
              OnERROR[${err.response?.statusCode}] 
              MessageError [
                "<-- ${err.message} ${(err.response?.requestOptions != null ? ('${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}') : 'URL')}");
                ]
                ErrorResponse [
                  "${err.response != null ? err.response?.data : 'Unknown Error'}");
                ]
              => PATH: ${err.requestOptions.path}
            """);
    debugPrint("<-- End error");
    if (err.response?.statusCode == 401) {
      debugPrint("401 UNAUTHORIZED");
      // throw AuthException(message: "Unauthorized", statusCode: 401);
    } else if (err.response?.statusCode == 403) {
      debugPrint("403 FORBIDDEN");
      // throw AuthException(message: "Forbidden", statusCode: 403);
    } else {
      debugPrint("ERROR ${err.message}");
    }
    return super.onError(err, handler);
  }
}
