import 'package:http/http.dart'as http;

import '../../constant/constant.dart';
class WebServices
{
  Future<dynamic> getAgentData() async
  {
    final response= await http.get(Uri.parse(baseUrl));
    return response;
  }
}