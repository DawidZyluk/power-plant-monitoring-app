import 'package:flutter/material.dart';
import 'package:mewa/models/phase_readings.dart';

class PhaseReading extends StatelessWidget {
  const PhaseReading({super.key, required this.reading});

  final PhaseReadings reading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reading.timestamp),
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
                Text(
                  'Id: ${reading.id.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Napięcie: ${reading.voltage.toString()} V',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Prąd: ${reading.current.toString()} A',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Moc czynna: ${reading.powerActive.toString()} W',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 25,),
                Text(
                  'Moc bierna: ${reading.powerReactive.toString()} var',
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
