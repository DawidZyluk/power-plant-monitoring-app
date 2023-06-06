import 'package:flutter/material.dart';
import 'package:mewa/models/water_readings.dart';

class WaterReading extends StatelessWidget {
  const WaterReading({super.key, required this.reading});
  


  final WaterReadings reading;

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
                  Text('data', style: TextStyle(color: Colors.white, fontSize: 22),),
                  Text('data', style: TextStyle(color: Colors.white, fontSize: 22),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Ciśnienie: ${reading.pressureStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('Odchylacze: ${reading.diverterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Olej: ${reading.oilStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('Woda: ${reading.waterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Poziom wody: ${reading.waterLevel.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('Pozycja odchylaczy: ${reading.diverterPosition.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
              ]),
            ],
          ),
        )
      ),
    );
  }
}