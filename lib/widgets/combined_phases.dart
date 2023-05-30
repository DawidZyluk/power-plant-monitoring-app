import 'package:flutter/material.dart';
import 'package:mewa/models/combined_phases.dart';

class CombinedPhasesWidget extends StatelessWidget {
  const CombinedPhasesWidget({super.key, required this.reading, required this.onSelectCategory});

  final CombinedPhases reading;
  final void Function(int phaseNumber) onSelectCategory;

  @override
  Widget build(BuildContext context) {
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
                  'Id: ${reading.id.toString()}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  reading.timestamp,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () => onSelectCategory(1),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Text(
                  'phase 1 id: ${reading.phase1Id.toString()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () => onSelectCategory(2),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Text(
                  'phase 2 id: ${reading.phase2Id.toString()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),InkWell(
                onTap: () => onSelectCategory(3),
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                child: Text(
                  'phase 3 id: ${reading.phase3Id.toString()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ]),
          ],
        ),
      )),
    );
  }
}
