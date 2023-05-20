import 'package:flutter/material.dart';
import 'package:mewa/models/water_readings.dart';

class WaterReading extends StatelessWidget {
  const WaterReading({super.key, required this.reading});
  


  final WaterReadings reading;

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
            Text('pressureStatus: ${reading.pressureStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('diverterStatus: ${reading.diverterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('oilStatus: ${reading.oilStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('waterStatus: ${reading.waterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('waterLevel: ${reading.waterLevel.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('diverterPosition: ${reading.diverterPosition.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
        ],
      )
    );
  }
}