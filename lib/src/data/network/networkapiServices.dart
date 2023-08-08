
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart';
import 'package:mymodalview/src/data/app_excaption.dart';
import 'package:mymodalview/src/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getResponse(String url) async {

    dynamic responseJson;

    try{

      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{

      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    // TODO: implement getPostApiResponse
    dynamic responseJson;

    try{

      Response response = await post(
          Uri.parse(url),
          body: data
      ).timeout(Duration(seconds: 10));


      responseJson = returnResponse(response);

    }on SocketException{

      throw FetchDataException('No Internet Connection');
    }

    return responseJson;

  }




  //============class for getResponse= ==================

  dynamic returnResponse (http.Response response){

    switch(response.statusCode){

      case 200:
        dynamic responsejson =  jsonDecode(response.body);
        return responsejson;

      case 400:
        throw BadRequestException(response.body);

      case 404:
        throw UnauthorisedException(response.body);

        default:
          throw FetchDataException('Error accured while commuunication with server' +
              'with status code' + response.statusCode.toString());
    }
  }






}