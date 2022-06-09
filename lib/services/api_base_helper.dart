import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class ApiBaseHelper {
  final String _baseUrl = "";

  Future<dynamic> get(String url) async {
    var responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl + url));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load album');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(response.body.toString());
    }
  }
}
