import 'package:flutter/material.dart';
import 'package:mewa/models/phase_readings.dart';

class PhaseReading extends StatelessWidget {
  const PhaseReading({super.key, required this.reading});
  


  final PhaseReadings reading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text('Id: ${reading.id.toString()}', style: TextStyle(color: Colors.white, fontSize: 22),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('voltage: ${reading.voltage.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('current: ${reading.current.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('powerActive: ${reading.powerActive.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('powerReactive: ${reading.powerReactive.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
        ],
      )
    );
  }
}