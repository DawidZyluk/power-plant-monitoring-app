import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:MEWA/models/category.dart';
import 'package:MEWA/models/chart_data.dart';
import 'package:MEWA/models/phase_readings.dart';
import 'package:MEWA/models/water_readings.dart';
import 'package:MEWA/models/electric_avg.dart';
import 'package:MEWA/services/api_service.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Odczyty faz',
    color: Colors.green,
  ),
  Category(
    id: 'c4',
    title: 'Wykres',
    color: Color.fromARGB(255, 255, 174, 0),
  ),
  Category(
    id: 'c5',
    title: 'Podsumowanie miesiąca',
    color: Colors.pink,
  ),
  Category(
    id: 'c3',
    title: 'Odczyty wody',
    color: Colors.blue,
  ),
  Category(
    id: 'c2',
    title: 'Zapotrzebowanie',
    color: Colors.red,
  ),  
];

int combinedPhasesAvgPagesLoaded = 1;
int electricAvgPagesLoaded = 1;
int waterReadingsPagesLoaded = 1;

List<PhaseReadings> phase1 = [];
List<PhaseReadings> phase2 = [];
List<PhaseReadings> phase3 = [];
List<PhaseReadings> combinedPhasesAvg = [];
List<PhaseReadings> combinedPhasesMonthAvg = [];
List<ChartData> avgPowerActive = [];

List<ElectricAvg> electricAvg = [];
List<WaterReadings> waterReadings = [];

Future getAllData() async {
  await getPhases(false);
  await getElectricAvg(false);
  await getWaterReadings(false);
  await getAvgPowerActive(1);
  await getCombinedPhasesMonthAvg();
  getCombinedPhases();
}

String formatTimestamp(String timestamp) {
  final DateTimeTimestamp = DateTime.parse(timestamp);
  final ourTimeZone = DateTime(
          DateTimeTimestamp.year,
          DateTimeTimestamp.month,
          DateTimeTimestamp.day,
          DateTimeTimestamp.hour + 2,
          DateTimeTimestamp.minute);
    final format = new DateFormat('dd.MM.yyyy HH:mm');
    return format.format(ourTimeZone);
}

Future getPhases(bool getMore) async {
  getMore ? combinedPhasesAvgPagesLoaded++ : combinedPhasesAvgPagesLoaded;

  phase1 = [];
  var result = await APIService.fetchPhase(1, combinedPhasesAvgPagesLoaded);
  for(final item in result.dataset) {
    phase1.add(PhaseReadings(timestamp: formatTimestamp(item[0]), voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
  }

  phase2 = [];
  result = await APIService.fetchPhase(2, combinedPhasesAvgPagesLoaded);
  for(final item in result.dataset) {
    phase2.add(PhaseReadings(timestamp: formatTimestamp(item[0]), voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
  }

  phase3 = [];
  result = await APIService.fetchPhase(3, combinedPhasesAvgPagesLoaded);
  for(final item in result.dataset) {
    phase3.add(PhaseReadings(timestamp: formatTimestamp(item[0]), voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
  }
  getCombinedPhases();
}


Future getElectricAvg(bool getMore) async {
  getMore ? electricAvgPagesLoaded++ : electricAvgPagesLoaded;

  electricAvg = [];
  var result = await APIService.fetchElectricAvg(electricAvgPagesLoaded);
  for(final item in result.dataset) {
    electricAvg.add(ElectricAvg(timestamp: formatTimestamp(item[0]), currentDemand: item[1], powerActiveDemand: item[2], powerApparentDemand: item[3]));
  }
}

Future getWaterReadings(bool getMore) async {
  getMore ? waterReadingsPagesLoaded++ : waterReadingsPagesLoaded;
  waterReadings = [];
  var result = await APIService.fetchWaterReadings(waterReadingsPagesLoaded);

  for(final item in result.dataset) {
    waterReadings.add(WaterReadings(timestamp: formatTimestamp(item[0]), pressureStatus: item[1], diverterStatus: item[2], oilStatus: item[3], waterStatus: item[4], waterLevel: 3, diverterPosition: 2));
  }
}

Future getAvgPowerActive(double timeRangeDays) async {
  avgPowerActive = [];
    var result = await APIService.fetchPowerActive(timeRangeDays);
    if(result.dataset.length < 60){
      var oldest = await APIService.fetchOldest();
      var latest = await APIService.fetchLatest();
      var oldestDate = DateTime.parse(oldest.dataset[0][0]);
      var latestDate = DateTime.parse(latest.dataset[0][0]);
      var days = oldestDate.difference(latestDate).inDays;
      result = await APIService.fetchPowerActive(days.toDouble());
    }
    for(int i = result.dataset.length - 1; i >= 0; i--) {
      avgPowerActive.add(ChartData(formatTimestamp(result.dataset[i][0]), result.dataset[i][1]));
    }
}

void getCombinedPhases() {
  combinedPhasesAvg = [];
  for(int index = 0; index < phase1.length; index++) {
    String timestamp = phase1[index].timestamp;
    String voltageAvg = ((phase1[index].voltage + phase2[index].voltage + phase3[index].voltage) / 3).toStringAsFixed(2);
    String currentAvg = ((phase1[index].current + phase2[index].current + phase3[index].current) / 3).toStringAsFixed(2);
    String powerActiveAvg = ((phase1[index].powerActive + phase2[index].powerActive + phase3[index].powerActive) / 3).toStringAsFixed(2);
    String powerReactiveAvg = ((phase1[index].powerReactive + phase2[index].powerReactive + phase3[index].powerReactive) / 3).toStringAsFixed(2);
    String powerApparentAvg = ((phase1[index].powerApparent + phase2[index].powerApparent + phase3[index].powerApparent) / 3).toStringAsFixed(2);
    combinedPhasesAvg.add(PhaseReadings(timestamp: timestamp, voltage: double.parse(voltageAvg), current: double.parse(currentAvg), powerActive: double.parse(powerActiveAvg), powerReactive: double.parse(powerReactiveAvg), powerApparent: double.parse(powerApparentAvg)));
  }
}

Future getCombinedPhasesMonthAvg() async {
  combinedPhasesMonthAvg = [];
  var result = await APIService.fetchCurrentMonth();
  for(int index = 0; index < result.dataset.length; index++) {
    var item = result.dataset[index];
    combinedPhasesMonthAvg.add(PhaseReadings(timestamp: formatTimestamp(item[0]), voltage: item[1], current: item[2], powerActive: item[3], powerReactive: item[4], powerApparent: item[5]));
  }
}

