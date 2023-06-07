import 'package:flutter/material.dart';

import 'package:mewa/models/category.dart';
import 'package:mewa/models/combined_phases.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/models/water_readings.dart';
import 'package:mewa/models/electric_avg.dart';
import 'package:mewa/services/api_service.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Odczyty faz',
    color: Colors.green,
  ),
  Category(
    id: 'c2',
    title: 'Zapotrzebowanie',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Odczyty wody',
    color: Colors.blue,
  ),
];

List<CombinedPhases> combinedPhases = [];
List<PhaseReadings> phase1 = [];
List<PhaseReadings> phase2 = [];
List<PhaseReadings> phase3 = [];
List<ElectricAvg> electricAvg= [];
List<WaterReadings> waterReadings = [];

Future getAllData() async {
  await getPhase('1');
  await getPhase('2');
  await getPhase('3');
  await getCombinedPhases();
  await getElectricAvg();
  await getWaterReadings();
}

Future getPhase(String phase) async {
  if(phase == '1') {
    phase1 = [];
    var result = await APIService.fetchPhase('1');
    for(final item in result.dataset) {
      phase1.add(PhaseReadings(id: item[0], timestamp: item[1], phase: item[2], voltage: item[3], current: item[4], powerActive: item[5], powerReactive: item[6], powerApparent: item[7]));
  }
  }

  if(phase == '2') {
    phase2 = [];
    var result = await APIService.fetchPhase('2');
    for(final item in result.dataset) {
      phase2.add(PhaseReadings(id: item[0], timestamp: item[1], phase: item[2], voltage: item[3], current: item[4], powerActive: item[5], powerReactive: item[6], powerApparent: item[7]));
    }
  }

  if(phase == '3') {
    phase3 = [];
    var result = await APIService.fetchPhase('3');
    for(final item in result.dataset) {
      phase3.add(PhaseReadings(id: item[0], timestamp: item[1], phase: item[2], voltage: item[3], current: item[4], powerActive: item[5], powerReactive: item[6], powerApparent: item[7]));
    }
  }
}

Future getCombinedPhases() async {
  combinedPhases = [];
  var result = await APIService.fetchCombinedPhases();
  for(final item in result.dataset) {
    combinedPhases.add(CombinedPhases(id: item[0], timestamp: item[1], phase1Id: item[2], phase2Id: item[3], phase3Id: item[4]));
  }
}


Future getElectricAvg() async {
  electricAvg = [];
  var result = await APIService.fetchElectricAvg();
  for(final item in result.dataset) {
    electricAvg.add(ElectricAvg(id: item[0], timestamp: item[1], currentDemand: item[2], powerActiveDemand: item[3], powerApparentDemand: item[4]));
  }
}

Future getWaterReadings() async {
  waterReadings = [];
  var result = await APIService.fetchWaterReadings();
  for(final item in result.dataset) {
    waterReadings.add(WaterReadings(id: item[0], timestamp: item[1], pressureStatus: item[2], diverterStatus: item[3], oilStatus: item[4], waterStatus: item[5], waterLevel: item[6], diverterPosition: item[7]));
  }
}
