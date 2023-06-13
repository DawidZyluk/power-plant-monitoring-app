import 'package:flutter/material.dart';
import 'package:MEWA/models/phase_readings.dart';

class PhaseReading extends StatelessWidget {
  const PhaseReading({super.key, required this.reading});

  final PhaseReadings reading;

  @override
  Widget build(BuildContext context) {
    final timeReading = DateTime.parse(reading.timestamp);
    final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

    final timestamp = ourTimeZone.split('T');
    final time = timestamp[1].split('.')[0].substring(0,5);

    return Scaffold(
      appBar: AppBar(
        title: Text(time),
      ),
      body: Container(
        height: 300,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                Text(
                  'Napięcie: ${reading.voltage.toStringAsFixed(2)} V',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Prąd: ${reading.current.toStringAsFixed(2)} A',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Moc czynna: ${(reading.powerActive/1000).toStringAsFixed(2)} kW',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Moc bierna: ${(reading.powerReactive/1000).toStringAsFixed(2)} kVar',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
