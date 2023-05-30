import 'package:flutter/material.dart';
import 'package:mewa/models/electric_avg.dart';

class ElectricAvgWidget extends StatelessWidget {
  const ElectricAvgWidget({super.key, required this.reading});
  


  final ElectricAvg reading;

  @override
  Widget build(BuildContext context) {
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
                  Text('Id: ${reading.id.toString()}', style: TextStyle(color: Colors.white, fontSize: 22),),
                  Text('${reading.timestamp}', style: TextStyle(color: Colors.white, fontSize: 22),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('voltage: ${reading.currentDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('current: ${reading.powerActiveDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('current: ${reading.powerApparentDemand.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
            ],
          ),
        )
      ),
    );
  }
}