
import 'package:mymodalview/src/data/network/baseApiServices.dart';
import 'package:mymodalview/src/data/network/networkapiServices.dart';
import 'package:mymodalview/src/utils/url/url.dart';

class AuthRepository{

BaseApiServices _apiServises = NetworkApiServices();

Future<dynamic> loginApi( dynamic data) async{
  try{

    dynamic response = await _apiServises.getPostApiResponse(AppUrl.loginUrl,  data);
    return response;

  }catch(e){
    throw e;
  }
}


Future<dynamic> signUpApi( dynamic data) async{
  try{

    dynamic response = await _apiServises.getPostApiResponse(AppUrl.registerUrl,  data);
    return response;

  }catch(e){
    throw e;
  }
}
}