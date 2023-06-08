import 'package:flutter/material.dart';

import 'package:mewa/models/category.dart';
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

List<PhaseReadings> phase1 = [];
List<PhaseReadings> phase2 = [];
List<PhaseReadings> phase3 = [];
List<ElectricAvg> electricAvg= [];
List<WaterReadings> waterReadings = [];

Future getAllData() async {
  await getPhase('1');
  await getPhase('2');
  await getPhase('3');
  await getElectricAvg();
  await getWaterReadings();
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
    waterReadings.add(WaterReadings(timestamp: item[0], pressureStatus: item[1], diverterStatus: item[2], oilStatus: item[3], waterStatus: item[4], waterLevel: item[5], diverterPosition: item[6]));
  }
}
