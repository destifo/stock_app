import 'dart:convert';

import 'package:http/http.dart' as http;

class OverviewRemoteDataProvider {
  final String baseURL =
      'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en';

  Future<Map<String, dynamic>> getOverview() async {
    final response = await http.get(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return body;
    }

    throw Exception('Trouble connecting to the end point');
  }
}
