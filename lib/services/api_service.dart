import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:MEWA/models/data_response.dart';

class APIService {
  static var client = http.Client();

  static Future<DataResponse> fetchLatest() async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20ts%20FROM%20phase%20ORDER%20BY%20ts%20ASC%20LIMIT%201%3B&nm=true"));

    return DataResponseFromJson(response.body);
  }

    static Future<DataResponse> fetchOldest() async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20ts%20FROM%20phase%20ORDER%20BY%20ts%20DESC%20LIMIT%201%3B&nm=true"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchPhase(int phase, int pages) async {
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20phase%20LATEST%20BY%20ts%20WHERE%20%20phase~'$phase'%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=${pages * 20}"));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchElectricAvg(int pages) async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20electric_avg%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=${pages * 20}'));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchWaterReadings(int pages) async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20*%20FROM%20panel%20LATEST%20BY%20ts%20ORDER%20BY%20ts%20DESC%3B&nm=true&limit=${pages * 20}'));

    return DataResponseFromJson(response.body);
  }

  static Future<DataResponse> fetchPowerActive(double timeRangeDays) async {
    int limit = 60;
    double sampleByMinutes = (timeRangeDays * 24 * 60) / limit;
    print('sampleByMinutes: $sampleByMinutes');
    final response = await http.get(Uri.parse("${dotenv.env['DATABASE_URL2']!}/exec?query=SELECT%20ts%2C%20avg(power_active)%20FROM%0A(SELECT%20ts%2C%20power_active%20FROM%20phase)%20timestamp(ts)%0ASAMPLE%20BY%20${sampleByMinutes.toInt()}m%20ORDER%20BY%20ts%20DESC%20LIMIT%20${limit.toInt()}%3B&nm=true"));

    return DataResponseFromJson(response.body);
  }
}