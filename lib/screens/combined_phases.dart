import 'package:flutter/material.dart';
import 'package:mewa/data/data.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/widgets/combined_phases.dart';
import 'package:mewa/widgets/phase_reading.dart';

class CombinedPhasesScreen extends StatelessWidget {
  const CombinedPhasesScreen(
      {super.key, required this.title});

  final String title;

  void _selectPhase(BuildContext context, PhaseReadings readings) {
    Widget screen = PhaseReading(reading: readings);

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Brak odczytów",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Coś poszło nie tak",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (phase1.isNotEmpty && phase2.isNotEmpty && phase3.isNotEmpty) {
      content = ListView.builder(
        itemCount: phase1.length,
        itemBuilder: (ctx, index) {
          return CombinedPhasesWidget(
              index: index,
              reading: phase1[index],
              onSelectPhase: (int phaseNumber) {
                PhaseReadings phaseInfo = phase1[index];
                if(phaseNumber == 1) phaseInfo = phase1[index];
                if(phaseNumber == 2) phaseInfo = phase2[index];
                if(phaseNumber == 3) phaseInfo = phase3[index];
                _selectPhase(context, phaseInfo);
              },
            );
          }
        );
     }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
