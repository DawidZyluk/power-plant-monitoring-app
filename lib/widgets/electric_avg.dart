import 'package:flutter/material.dart';
import 'package:MEWA/models/electric_avg.dart';

class ElectricAvgWidget extends StatelessWidget {
  const ElectricAvgWidget({super.key, required this.reading});

  final ElectricAvg reading;

  
  @override
  Widget build(BuildContext context) {
    final timeReading = DateTime.parse(reading.timestamp);
    final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

    final timestamp = ourTimeZone.split('T');
    final date = timestamp[0];
    final time = timestamp[1].split('.')[0];

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(time, style: TextStyle(color: Colors.white, fontSize: 22),),
                  Text(date, style: TextStyle(color: Colors.white, fontSize: 22),),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('${reading.currentDemand.toStringAsFixed(2)} V', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('${(reading.powerActiveDemand / 1000).toStringAsFixed(2)} kW', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('${(reading.powerApparentDemand / 1000).toStringAsFixed(2)} kVA', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
            ],
          ),
        )
      ),
    );
  }
}