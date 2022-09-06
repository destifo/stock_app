import 'dart:convert';

import 'package:http/http.dart' as http;

class PerformanceRemoteDataProvider {
  final String baseURL =
      'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en';

  Future<List<dynamic>> getPerformanceStats() async {
    final response =
        await http.get(Uri.parse(baseURL), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return body;
    }

    throw Exception('Trouble connecting to the end point');
  }
}
