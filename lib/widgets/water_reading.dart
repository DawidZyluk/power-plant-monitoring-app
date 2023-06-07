import 'package:flutter/material.dart';
import 'package:mewa/models/water_readings.dart';
import 'package:mewa/widgets/display_bool.dart';

class WaterReading extends StatelessWidget {
  const WaterReading({super.key, required this.reading});
  


  final WaterReadings reading;

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
                //Text('Ciśnienie: ${reading.pressureStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                DisplayBool(title: "Ciśnienie", value: reading.pressureStatus,),
                //Text('Odchylacze: ${reading.diverterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                DisplayBool(title: "Odchylacze", value: reading.diverterStatus,),
              ]),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                //Text('Olej: ${reading.oilStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                DisplayBool(title: "           Olej", value: reading.oilStatus,),
                //Text('Woda: ${reading.waterStatus.toString()}', style: TextStyle(color: Colors.white, fontSize: 18),),
                DisplayBool(title: "Woda", value: reading.waterStatus,),
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