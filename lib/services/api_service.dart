import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:mewa/models/data_response.dart';

class APIService {
  static var client = http.Client();

  // static Future<DataResponse> fetchData() async {
  //   final response = await http.get(Uri.parse(dotenv.env['DATABASE_URL']!));

  //   return DataResponseFromJson(response.body);
  // }

    static Future<DataResponse> fetchCombinedPhases() async {
    final response = await http.get(Uri.parse('${dotenv.env['DATABASE_URL']!}/exec?query=SELECT * FROM combined_phases &nm=true&limit=10'));

    return DataResponseFromJson(response.body);
  }
}