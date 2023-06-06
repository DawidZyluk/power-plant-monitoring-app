import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:mewa/models/data_response.dart';

class APIService {
  static var client = http.Client();

  static Future<DataResponse> fetchData() async {
    final response = await http.get(Uri.parse(dotenv.env['DATABASE_URL']!));

    return DataResponseFromJson(response.body);
  }
}