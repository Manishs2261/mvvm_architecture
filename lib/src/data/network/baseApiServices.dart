
abstract class BaseApiServices{

  Future<dynamic> getResponse(String url);

  Future<dynamic> getPostApiResponse(String url,dynamic data);
}