import 'package:flutter/material.dart';
import 'package:MEWA/models/water_readings.dart';
import 'package:MEWA/widgets/display_bool.dart';

class WaterReading extends StatelessWidget {
  const WaterReading({super.key, required this.reading});
  


  final WaterReadings reading;

  @override
  Widget build(BuildContext context) {
    final timeReading = DateTime.parse(reading.timestamp);
    final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

    final timestamp = ourTimeZone.split('T');
    final date = timestamp[0];
    final time = timestamp[1].split('.')[0].substring(0,5);

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