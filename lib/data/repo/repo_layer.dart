import 'package:valorant/data/web_services/web_services.dart';

class RepoLayer {
  final WebServices webServices;

  RepoLayer({required this.webServices});

  Future<dynamic> getAgentData() async
  {
    return webServices.getAgentData();
  }
}