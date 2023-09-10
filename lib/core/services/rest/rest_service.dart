import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cookbook/core/core.dart';
import 'package:cookbook/core/error/exception.dart';
import 'package:http/http.dart' as http;

class RestService {

  final http.Client client;
  String _baseUrl= Api.baseUrl;
  int connectTimeout = 25000;
  int receiveTimeout = 25000;

  RestService({required this.client});

  void changeApiAddress(String api) => _baseUrl = api;

  //GET
  Future<dynamic> getRequest(String api) async{
    var uri = Uri.parse(_baseUrl + api);
    print('getRequest === $uri');
    try{
      var response = await client.get(
        uri,
        headers: {'Accept': 'application/json'},);
      print('getRequest === $response');
      return _processResponse(response);
    }on SocketException {
      throw FetchDataExeption('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingExeption('Api not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> postRequest(String api, dynamic payloadObj) async{
    var uri = Uri.parse(_baseUrl + api);
    var payload = jsonDecode(payloadObj);
    try{
      var response = await client.post(uri, body: payload);
      return _processResponse(response);
    }on SocketException {
      throw FetchDataExeption('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingExeption('Api not responded in time', uri.toString());
    }
  }


  dynamic _processResponse(http.Response response){
    switch (response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 400:
        throw BadRequestExeption(jsonDecode(response.body), response.request.toString());
      case 401:
      case 403:
        throw UnAuthorizedExeption(jsonDecode(response.body), response.request.toString());
      case 500:
      default:
        throw FetchDataExeption('Error occured with code: ${response.statusCode}', response.request.toString());
    }
  }

}




// Map map = {
//   "jsonrpc":"2.0",
//   "method":NetworkServices.GET_HOME_CATALOG,
//   "params": {
//     "id": "1",
//   }
// };
// var body = json.encode(map);
// final response = await http.post(
//     Uri.parse(NetworkServices.ROOT),
//     body: body,
//     headers: {'Accept': 'application/json'}
// );