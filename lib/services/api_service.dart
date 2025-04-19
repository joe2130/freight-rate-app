// ignore: unused_import
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<String>> fetchPortSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final mockPorts = [
      "Rotterdam Port",
      "Shanghai Port",
      "Singapore Port",
      "Los Angeles Port",
      "Hamburg Port",
      "Dubai Port",
      "Busan Port",
    ];

    return mockPorts.where((port) {
      return port.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}