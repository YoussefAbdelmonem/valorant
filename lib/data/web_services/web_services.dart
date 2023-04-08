import 'package:http/http.dart'as http;

import '../../constant/constant.dart';
class WebServices
{

  Future<dynamic> getAgentData() async {
    final response =
    //spanish language use "$url/agents?language=es-ES"
    await http.get(Uri.parse('$baseUrl/agents'), headers: {
      'Content-Type': 'application/json',
      'data': ['data'].toString(),
    });

    return response;
  }
}