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
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20phase%20LATEST%20BY%20ts%20WHERE%20%20phase%3D'$phase'%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchElectricAvg() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20electric_avg%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchWaterReadings() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20panel%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }
}