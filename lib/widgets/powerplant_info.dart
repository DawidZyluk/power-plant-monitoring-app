import 'package:flutter/material.dart';
import 'package:mewa/models/data_response.dart';
import 'package:mewa/services/api_service.dart';

class PowerplantInfo extends StatefulWidget {
  const PowerplantInfo({super.key});

  @override
  State<PowerplantInfo> createState() => _PowerplantInfoState();
}

class _PowerplantInfoState extends State<PowerplantInfo> {
  late Future<DataResponse> futureData;

  @override
  void initState() {
    super.initState();
    futureData = APIService.fetchCombinedPhases();
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<DataResponse>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            return Text("information");
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      );
  }
}
