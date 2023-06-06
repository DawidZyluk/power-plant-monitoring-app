import 'package:flutter/material.dart';
import 'package:mewa/data/dummy_data.dart';
import 'package:mewa/models/combined_phases.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/widgets/combined_phases.dart';
import 'package:mewa/services/api_service.dart';
import 'package:mewa/widgets/phase_reading.dart';

class CombinedPhasesScreen extends StatelessWidget {
  const CombinedPhasesScreen(
      {super.key, required this.title, required this.readings});

  final String title;
  final List<CombinedPhases> readings;

  void _selectCategory(BuildContext context, PhaseReadings readings) {
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

    if (readings.isNotEmpty) {
      content = ListView.builder(
        itemCount: readings.length,
        itemBuilder: (ctx, index) => CombinedPhasesWidget(
              reading: readings[index],
              onSelectCategory: (int phaseNumber) {
                PhaseReadings phaseInfo = phase1[index];
                if(phaseNumber == 1) phaseInfo = phase1[readings[index].phase1Id-1];
                if(phaseNumber == 2) phaseInfo = phase2[readings[index].phase2Id-1];
                if(phaseNumber == 3) phaseInfo = phase3[readings[index].phase3Id-1];
                _selectCategory(context, phaseInfo);
              },
            )
            );

    //   content = FutureBuilder(
    //       future: APIService.fetchCombinedPhases(),
    //       builder: (context, AsyncSnapshot snapshot) {
    //         if (!snapshot.hasData) {
    //           return Center(child: CircularProgressIndicator());
    //         } else {
    //           return Container(
    //               child: ListView.builder(
    //                   itemCount: snapshot.data.dataset.length,
    //                   scrollDirection: Axis.vertical,
    //                   itemBuilder: (BuildContext context, int index) {

    //                     var item = snapshot.data.dataset[index];
    //                     //return Text('id: ${item[0]},timestamp: ${item[1]}, phase1Id: ${item[2]}, phase2Id: ${item[3]}, phase3Id: ${item[4]}');
                        
    //                     return CombinedPhasesWidget(
    //                       reading: CombinedPhases(id: item[0],timestamp: item[1], phase1Id: item[2], phase2Id: item[3], phase3Id: item[4]),
    //                       onSelectCategory: (int phaseNumber) {
    //                         // PhaseReadings phaseInfo = phase1[index];
    //                         // if (phaseNumber == 1)
    //                         //   phaseInfo = phase1[readings[index].phase1Id ];
    //                         // if (phaseNumber == 2)
    //                         //   phaseInfo = phase2[readings[index].phase2Id ];
    //                         // if (phaseNumber == 3)
    //                         //   phaseInfo = phase3[readings[index].phase3Id ];
    //                         // _selectCategory(context, phaseInfo);
    //                       },
    //                     );
    //                   }));
    //         }
    //       });
     }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
