import 'package:flutter/material.dart';
import 'package:mewa/models/electric_readings.dart';

class ElectricReading extends StatelessWidget {
  const ElectricReading({super.key, required this.reading});
  


  final ElectricReadings reading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Id: ${reading.id.toString()}', style: TextStyle(color: Colors.white, fontSize: 22),),
              Text(reading.timestamp, style: TextStyle(color: Colors.white, fontSize: 18),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('phase 1 id: ${reading.phase1Id.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('phase 2 id: ${reading.phase2Id.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('phase 3 id: ${reading.phase3Id.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('powerActiveAvg: ${reading.powerActiveAvg.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
        ],
      )
    );
  }
}