import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:mewa/models/data_response.dart';

class APIService {
  static var client = http.Client();

  // static Future<DataResponse> fetchData() async {
  //   final response = await http.get(Uri.parse(dotenv.env['DATABASE_URL']!));

  //   return DataResponseFromJson(response.body);
  // }

  static Future<DataResponse> fetchPhase(String phase) async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20phase%20WHERE%20phase%3D'$phase'&nm=true&limit=10"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchElectricAvg() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT * FROM electric_avg&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchWaterReadings() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT * FROM panel&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }
}