import 'package:flutter/material.dart';
import 'package:mewa/models/phase_readings.dart';

class PhaseReading extends StatelessWidget {
  const PhaseReading({super.key, required this.reading});

  final PhaseReadings reading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${reading.timestamp.split('T')[1].split('.')[0]} '),
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
