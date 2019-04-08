import 'dart:async';

import 'package:dio/dio.dart';
import 'package:okapia_app/common/log_utils.dart';
import 'package:okapia_app/env.dart';

class HttpApi {
  Dio _dio;

  Future<Dio> _getDio() async {
    if (_dio != null) {
      return _dio;
    }
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    var env = await Env.getCurEnv();
    String baseUrl = env.baseUrl;
    LogUtils.i("$TAG, baseurl = ${env.baseUrl}");
    dio.options.baseUrl = baseUrl;

    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          //Set the token to headers
//          var token = await LocalData.get().getToken();
//          if (token != null && token.isNotEmpty) {
//            options.headers[_authorization] = token;
//          }
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onError: (DioError e) {
          // Do something with response error
          return  e;//continue
        }
    ));
    _dio = dio;
    return _dio;
  }


  Future<dynamic> getRequest(url, Map<String, String> params) async {
    var dio = await this._getDio();
    var response=await dio.get(url, queryParameters: params);
    LogUtils.i("$TAG, get:$url, params:$params");
    return response.data;
  }


  Future<dynamic> post(url, dynamic param) async {
    dynamic data = param;
    var dio = await this._getDio();
    var response= await dio.post(url, data: data);

    LogUtils.i("$TAG, post:$url,params:$param, response:${response.data}");
    return response.data;
  }

  static HttpApi get() => _instance;

  static const TAG = "HttpApi";
  static HttpApi _instance = HttpApi();
  static const _authorization = "authorization";
}
