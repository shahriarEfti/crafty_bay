import 'dart:convert';


import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../models/network_response.dart';

class NetworkCaller {
  final Logger logger;

  NetworkCaller({required this.logger});

  Future<NetworkResponse> getRequest({required String url, String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url,{},{},AuthController.accessToken??'');
      final Response  response = await get(uri, headers: {
        'token': '${token ?? AuthController.accessToken}',
      });

      if (response.statusCode == 200) {

        _responseLog(url,response.statusCode,response.body,response.headers,true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(

          isSucess: true,
          statusCode: response.statusCode,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
            isSucess: false,
            statusCode: response.statusCode,

        );
      }
    } catch (e) {
      _responseLog(url,-1,null,{},false,e);
      return NetworkResponse(isSucess: false,
        statusCode: -1,
        errorMessage: e.toString(),);
    }
  }
  Future<NetworkResponse> postRequest({required String url,Map<String ,dynamic>?body}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url,{},body??{} ,'');
      final Response  response = await post(uri,
          headers: {
        'token': '',
        'content-type':'aplication/json',

      },
          body:jsonEncode(body));



      if (response.statusCode == 200) {

        _responseLog(url,
            response.statusCode,response.body,response.headers,true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(

          isSucess: true,
          statusCode: response.statusCode,
          responseData: decodedBody,
        );
      } else {
        _responseLog(url,response.statusCode,response.body,response.headers,false);
        return NetworkResponse(
            isSucess: false, statusCode: response.statusCode);
      }
    } catch (e) {

      _responseLog(url,-1,null,{},false,e);
      return NetworkResponse(isSucess: false, statusCode: -1,
        errorMessage: e.toString(),);
    }
  }

  void _requestLog(String url, Map<String,dynamic>params,Map<String,dynamic>body,String token ){


    logger.i('''
    url:$url
    params:$params
    Body:$body
    Token :$token
    
    
    ''');
  }

  void _responseLog(String url, int statusCode,dynamic responseBody, Map<String,dynamic>headers, bool isSuccess ,[dynamic error]){


    String message ='''
    url:$url
    Status Code:$statusCode
    Response Body:$responseBody
    Headers :$headers
    Error:$error
    
    
    ''';
    if(isSuccess){
      logger.i(message);
    }else{

      logger.e(message);
    }
  }

}