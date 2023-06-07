import 'package:flutter/material.dart';
import 'package:mewa/models/electric_avg.dart';

class ElectricAvgWidget extends StatelessWidget {
  const ElectricAvgWidget({super.key, required this.reading});

  final ElectricAvg reading;

  
  @override
  Widget build(BuildContext context) {
    final timestamp = reading.timestamp.split('T');
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
                  Text(date, style: TextStyle(color: Colors.white, fontSize: 22),),
                  Text(time, style: TextStyle(color: Colors.white, fontSize: 22),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('${reading.currentDemand.toString()} V', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('${reading.powerActiveDemand.toString()} W', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('${reading.powerApparentDemand.toString()} VA', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
            ],
          ),
        )
      ),
    );
  }
}