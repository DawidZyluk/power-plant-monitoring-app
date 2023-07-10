import 'package:MEWA/models/combined_phases.dart';
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

List<PhaseReadings> phase1 = [];
List<PhaseReadings> phase2 = [];
List<PhaseReadings> phase3 = [];
List<CombinedPhase> combinedPhases = [];
List<ChartData> avgPowerActive = [];
List<ElectricAvg> electricAvg= [];
List<WaterReadings> waterReadings = [];

Future getAllData() async {
  await getPhase('1');
  await getPhase('2');
  await getPhase('3');
  await getElectricAvg();
  await getWaterReadings();
  await getAvgPowerActive(1);
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

Future getPhase(String phase) async {
  if(phase == '1') {
    phase1 = [];
    var result = await APIService.fetchPhase('1');
    for(final item in result.dataset) {
      phase1.add(PhaseReadings(timestamp: item[0], phase: item[1], voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
    }
  }

  if(phase == '2') {
    phase2 = [];
    var result = await APIService.fetchPhase('2');
    for(final item in result.dataset) {
      phase2.add(PhaseReadings(timestamp: item[0], phase: item[1], voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
    }
  }

  if(phase == '3') {
    phase3 = [];
    var result = await APIService.fetchPhase('3');
    for(final item in result.dataset) {
      phase3.add(PhaseReadings(timestamp: item[0], phase: item[1], voltage: item[2], current: item[3], powerActive: item[4], powerReactive: item[5], powerApparent: item[6]));
    }
  }
}


Future getElectricAvg() async {
  electricAvg = [];
  var result = await APIService.fetchElectricAvg();
  for(final item in result.dataset) {
    electricAvg.add(ElectricAvg(timestamp: item[0], currentDemand: item[1], powerActiveDemand: item[2], powerApparentDemand: item[3]));
  }
}

Future getWaterReadings() async {
  waterReadings = [];
  var result = await APIService.fetchWaterReadings();

  for(final item in result.dataset) {
    waterReadings.add(WaterReadings(timestamp: item[0], pressureStatus: item[1], diverterStatus: item[2], oilStatus: item[3], waterStatus: item[4], waterLevel: 3, diverterPosition: 2));
  }
}

Future getAvgPowerActive(double timeRangeDays) async {
  avgPowerActive = [];
    var result = await APIService.fetchPowerActive(timeRangeDays);
    for(int i = result.dataset.length - 1; i >= 0; i--) {
      avgPowerActive.add(ChartData(formatTimestamp(result.dataset[i][0]), result.dataset[i][1]));
    }
}

void getCombinedPhases() {
  combinedPhases = [];
  for(int index = 0; index < phase1.length; index++) {
    String timestamp = formatTimestamp(phase1[index].timestamp);
    String voltageAvg = ((phase1[index].voltage + phase2[index].voltage + phase3[index].voltage) / 3).toStringAsFixed(2);
    String currentAvg = ((phase1[index].current + phase2[index].current + phase3[index].current) / 3).toStringAsFixed(2);
    String powerActiveAvg = ((phase1[index].powerActive + phase2[index].powerActive + phase3[index].powerActive) / 3).toStringAsFixed(2);
    String powerReactiveAvg = ((phase1[index].powerReactive + phase2[index].powerReactive + phase3[index].powerReactive) / 3).toStringAsFixed(2);
    String powerApparentAvg = ((phase1[index].powerApparent + phase2[index].powerApparent + phase3[index].powerApparent) / 3).toStringAsFixed(2);
    combinedPhases.add(CombinedPhase(timestamp: timestamp, voltageAvg: double.parse(voltageAvg), currentAvg: double.parse(currentAvg), powerActiveAvg: double.parse(powerActiveAvg), powerReactiveAvg: double.parse(powerReactiveAvg), powerApparentAvg: double.parse(powerApparentAvg)));
  }
}

