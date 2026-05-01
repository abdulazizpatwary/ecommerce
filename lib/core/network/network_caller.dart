import 'dart:convert';

import 'package:ecommerce/core/network/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger _logger=Logger();
  Future<NetworkResponse> getRequest({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url += '?';
      for (String key in queryParams?.keys ?? {}) {
        url += '$key=${queryParams![key]}&';
      }

      Uri uri = Uri.parse(url);

      Map<String, String> headers = {'token': ''};
      _logRequest(url: url,headers: headers);
      Response response = await get(uri, headers: headers);
      _logResponse(url: url, response: response);
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedResponse,

        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedResponse['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedResponse['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': '',
      };
      _logRequest(url: url,headers: headers,body: body);
      Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url: url, response: response);
      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedData,

        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': '',
      };
      _logRequest(url: url,headers: headers,body: body);
      Response response = await put(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url: url, response: response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,

        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': '',
      };
      _logRequest(url: url,headers: headers,body: body);
      Response response = await patch(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url: url, response: response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedData
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: decodedData['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try{
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': '',
      };
      _logRequest(url: url,headers: headers,body: body);
      Response response = await delete(
        uri,
        body: jsonEncode(body),
        headers: headers,
      );
      _logResponse(url: url, response: response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedData,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseBody: decodedData,
          errorMsg: decodedData['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseBody: decodedData,
          errorMsg: decodedData['msg'],
        );
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorMsg: e.toString());
    }
  }
  void _logRequest({required String url, required Map<String,String> headers,Map<String,dynamic>?body}){
    _logger.i('Url=>$url\nheaders =>$headers\nbody=>$body');
  }
  void _logResponse({required String url,required Response response}){
    _logger.i('Url=>$url\nheaders =>${response.headers}\nstatusCode=>${response.statusCode}body=>${response.body}');
  }
}
