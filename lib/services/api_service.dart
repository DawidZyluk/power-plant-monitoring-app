import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:MEWA/models/data_response.dart';

class APIService {
  static var client = http.Client();

  static Future<DataResponse> fetchPhase(String phase) async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL']!}/exec?query=SELECT%20*%20FROM%20phase%20LATEST%20BY%20ts%20WHERE%20%20phase%3D'$phase'%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchPowerActive(String phase) async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL']!}/exec?query=SELECT%20ts%2C%20power_active%20FROM%20phase%20WHERE%20phase%3D'$phase'%20ORDER%20BY%20ts%20DESC%20LIMIT%2020%3B&nm=true&limit=20"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchElectricAvg() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL']!}/exec?query=SELECT%20*%20FROM%20electric_avg%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchWaterReadings() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL']!}/exec?query=SELECT%20*%20FROM%20panel%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }
}