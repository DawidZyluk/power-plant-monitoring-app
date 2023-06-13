import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:MEWA/models/phase_readings.dart';

class CombinedPhasesWidget extends StatelessWidget {
  const CombinedPhasesWidget(
      {super.key, required this.index, required this.reading, required this.onSelectPhase});

  final int index;
  final PhaseReadings reading;
  final void Function(int phaseNumber) onSelectPhase;

  @override
  Widget build(BuildContext context) {

    final timeReading = DateTime.parse(reading.timestamp);
    final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

    final timestamp = ourTimeZone.split('T');
    final date = timestamp[0];
    final time = timestamp[1].split('.')[0];

    double voltageAvg = (phase1[index].voltage + phase2[index].voltage + phase3[index].voltage) / 3;
    double currentAvg = (phase1[index].current + phase2[index].current + phase3[index].current) / 3;
    double powerActiveAvg = (phase1[index].powerActive + phase2[index].powerActive + phase3[index].powerActive) / 3;
    double powerReactiveAvg = (phase1[index].powerReactive + phase2[index].powerReactive + phase3[index].powerReactive) / 3;
    double powerApparentAvg = (phase1[index].powerApparent + phase2[index].powerApparent + phase3[index].powerApparent) / 3;

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${voltageAvg.toStringAsFixed(2)} V",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${currentAvg.toStringAsFixed(2)} A",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${(powerActiveAvg/1000).toStringAsFixed(2)} kW",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${(powerReactiveAvg/1000).toStringAsFixed(2)} kVar",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${(powerApparentAvg/1000).toStringAsFixed(2)} kVA",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () => onSelectPhase(1),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'Faza 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSelectPhase(2),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'Faza 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSelectPhase(3),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'Faza 3',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ]),
          ],
        ),
      )),
    );
  }
}
