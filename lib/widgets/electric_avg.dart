import 'package:flutter/material.dart';
import 'package:mewa/models/electric_avg.dart';

class ElectricAvgWidget extends StatelessWidget {
  const ElectricAvgWidget({super.key, required this.reading});
  


  final ElectricAvg reading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Id: ${reading.id.toString()}', style: TextStyle(color: Colors.white, fontSize: 22),),
              Text('Id: ${reading.timestamp}', style: TextStyle(color: Colors.white, fontSize: 22),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('voltage: ${reading.currentDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('current: ${reading.powerActiveDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
            Text('current: ${reading.powerApparentDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
          ]),
        ],
      )
    );
  }
}