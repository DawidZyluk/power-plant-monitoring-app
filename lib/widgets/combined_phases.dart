import 'package:flutter/material.dart';
import 'package:mewa/data/dummy_data.dart';
import 'package:mewa/models/combined_phases.dart';

class CombinedPhasesWidget extends StatelessWidget {
  const CombinedPhasesWidget(
      {super.key, required this.reading, required this.onSelectCategory});

  final CombinedPhases reading;
  final void Function(int phaseNumber) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    String date = reading.timestamp.split(" ")[0];
    String time = reading.timestamp.split(" ")[1];
    print(phase1[reading.phase1Id].current);

    double voltageAvg = (phase1[reading.phase1Id].voltage + phase2[reading.phase2Id].voltage + phase3[reading.phase3Id].voltage) / 3;
    double currentAvg = (phase1[reading.phase1Id].current + phase2[reading.phase2Id].current + phase3[reading.phase3Id].current) / 3;
    double powerActiveAvg = (phase1[reading.phase1Id].powerActive + phase2[reading.phase2Id].powerActive + phase3[reading.phase3Id].powerActive) / 3;
    double powerReactiveAvg = (phase1[reading.phase1Id].powerReactive + phase2[reading.phase2Id].powerReactive + phase3[reading.phase3Id].powerReactive) / 3;
    double powerApparentAvg = (phase1[reading.phase1Id].powerApparent + phase2[reading.phase2Id].powerApparent + phase3[reading.phase3Id].powerApparent) / 3;

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
                  "Średnia napięcia: ${voltageAvg.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Średnia prądu: ${currentAvg.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Średnia mocy aktywnej: ${powerActiveAvg.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Średnia mocy biernej: ${powerReactiveAvg.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Średnia mocy pozornej: ${powerApparentAvg.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () => onSelectCategory(1),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'phase 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSelectCategory(2),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'phase 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSelectCategory(3),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'phase 3',
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
