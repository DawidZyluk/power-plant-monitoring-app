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

const phase1 = [
PhaseReadings(id: 1, timestamp: "2023-05-27 16:28:01.689", phase: 1, voltage: 219.4, current: 2.9, powerActive: 111.2, powerReactive: 40.2, powerApparent: 55.2),
PhaseReadings(id: 2, timestamp: "2023-05-27 16:33:01.689", phase: 1, voltage: 227.8, current: 2.7, powerActive: 110.0, powerReactive: 40.0, powerApparent: 30.7),
PhaseReadings(id: 3, timestamp: "2023-05-27 16:38:01.689", phase: 1, voltage: 221.9, current: 2.9, powerActive: 87.0, powerReactive: 43.0, powerApparent: 33.8),
PhaseReadings(id: 4, timestamp: "2023-05-27 16:43:01.689", phase: 1, voltage: 226.3, current: 2.0, powerActive: 105.5, powerReactive: 41.7, powerApparent: 63.2),
PhaseReadings(id: 5, timestamp: "2023-05-27 16:48:01.689", phase: 1, voltage: 221.0, current: 2.1, powerActive: 93.2, powerReactive: 46.7, powerApparent: 66.9),
PhaseReadings(id: 6, timestamp: "2023-05-27 16:53:01.689", phase: 1, voltage: 216.9, current: 2.3, powerActive: 99.3, powerReactive: 37.7, powerApparent: 45.9),
PhaseReadings(id: 7, timestamp: "2023-05-27 16:58:01.689", phase: 1, voltage: 220.4, current: 2.6, powerActive: 82.7, powerReactive: 48.2, powerApparent: 65.6),
PhaseReadings(id: 8, timestamp: "2023-05-27 17:03:01.689", phase: 1, voltage: 222.8, current: 2.7, powerActive: 83.1, powerReactive: 35.0, powerApparent: 64.1),
PhaseReadings(id: 9, timestamp: "2023-05-27 17:08:01.689", phase: 1, voltage: 219.4, current: 2.1, powerActive: 103.2, powerReactive: 67.0, powerApparent: 52.2),
PhaseReadings(id: 10, timestamp: "2023-05-27 17:13:01.689", phase: 1, voltage: 227.7, current: 2.8, powerActive: 103.5, powerReactive: 31.2, powerApparent: 32.0),
PhaseReadings(id: 11, timestamp: "2023-05-27 17:18:01.690", phase: 1, voltage: 210.5, current: 2.9, powerActive: 98.3, powerReactive: 64.4, powerApparent: 43.9),
PhaseReadings(id: 12, timestamp: "2023-05-27 17:23:01.690", phase: 1, voltage: 218.4, current: 3.0, powerActive: 106.1, powerReactive: 32.6, powerApparent: 53.6),
PhaseReadings(id: 13, timestamp: "2023-05-27 17:28:01.690", phase: 1, voltage: 227.2, current: 2.4, powerActive: 110.0, powerReactive: 46.1, powerApparent: 68.8),
PhaseReadings(id: 14, timestamp: "2023-05-27 17:33:01.690", phase: 1, voltage: 220.3, current: 2.8, powerActive: 119.5, powerReactive: 37.5, powerApparent: 38.9),
PhaseReadings(id: 15, timestamp: "2023-05-27 17:38:01.690", phase: 1, voltage: 220.6, current: 3.0, powerActive: 118.6, powerReactive: 69.4, powerApparent: 43.9),
PhaseReadings(id: 16, timestamp: "2023-05-27 17:43:01.690", phase: 1, voltage: 226.8, current: 2.4, powerActive: 102.6, powerReactive: 34.4, powerApparent: 36.7),
PhaseReadings(id: 17, timestamp: "2023-05-27 17:48:01.690", phase: 1, voltage: 223.7, current: 2.5, powerActive: 90.5, powerReactive: 52.4, powerApparent: 37.9),
PhaseReadings(id: 18, timestamp: "2023-05-27 17:53:01.690", phase: 1, voltage: 229.5, current: 2.5, powerActive: 119.5, powerReactive: 59.7, powerApparent: 54.1),
PhaseReadings(id: 19, timestamp: "2023-05-27 17:58:01.690", phase: 1, voltage: 210.5, current: 2.2, powerActive: 106.0, powerReactive: 54.6, powerApparent: 61.7),
PhaseReadings(id: 20, timestamp: "2023-05-27 18:03:01.690", phase: 1, voltage: 215.6, current: 2.3, powerActive: 89.0, powerReactive: 46.2, powerApparent: 40.3),
];

const phase2 = [
  PhaseReadings(id: 1, timestamp: "2023-05-27 16:34:23.636", phase: 2, voltage: 217.7, current: 2.4, powerActive: 107.2, powerReactive: 62.9, powerApparent: 38.8),
  PhaseReadings(id: 2, timestamp: "2023-05-27 16:39:23.637", phase: 2, voltage: 224.4, current: 2.9, powerActive: 100.2, powerReactive: 48.7, powerApparent: 49.0),
  PhaseReadings(id: 3, timestamp: "2023-05-27 16:44:23.637", phase: 2, voltage: 219.5, current: 2.8, powerActive: 108.6, powerReactive: 31.3, powerApparent: 37.5),
  PhaseReadings(id: 4, timestamp: "2023-05-27 16:49:23.637", phase: 2, voltage: 226.0, current: 3.0, powerActive: 115.8, powerReactive: 40.0, powerApparent: 32.0),
  PhaseReadings(id: 5, timestamp: "2023-05-27 16:54:23.637", phase: 2, voltage: 220.5, current: 2.1, powerActive: 108.9, powerReactive: 49.9, powerApparent: 51.2),
  PhaseReadings(id: 6, timestamp: "2023-05-27 16:59:23.637", phase: 2, voltage: 216.2, current: 2.1, powerActive: 113.5, powerReactive: 35.3, powerApparent: 52.9),
  PhaseReadings(id: 7, timestamp: "2023-05-27 17:04:23.637", phase: 2, voltage: 222.8, current: 2.3, powerActive: 99.1, powerReactive: 61.4, powerApparent: 48.1),
  PhaseReadings(id: 8, timestamp: "2023-05-27 17:09:23.637", phase: 2, voltage: 210.4, current: 2.6, powerActive: 115.7, powerReactive: 53.2, powerApparent: 58.3),
  PhaseReadings(id: 9, timestamp: "2023-05-27 17:14:23.637", phase: 2, voltage: 222.5, current: 2.2, powerActive: 108.1, powerReactive: 54.3, powerApparent: 32.3),
  PhaseReadings(id: 10, timestamp: "2023-05-27 17:19:23.637", phase: 2, voltage: 213.6, current: 3.0, powerActive: 81.2, powerReactive: 55.3, powerApparent: 37.3),
  PhaseReadings(id: 11, timestamp: "2023-05-27 17:24:23.638", phase: 2, voltage: 226.1, current: 2.9, powerActive: 116.6, powerReactive: 41.7, powerApparent: 67.7),
  PhaseReadings(id: 12, timestamp: "2023-05-27 17:29:23.638", phase: 2, voltage: 226.4, current: 2.6, powerActive: 84.9, powerReactive: 62.9, powerApparent: 64.1),
  PhaseReadings(id: 13, timestamp: "2023-05-27 17:34:23.638", phase: 2, voltage: 214.7, current: 2.6, powerActive: 106.6, powerReactive: 51.5, powerApparent: 64.0),
  PhaseReadings(id: 14, timestamp: "2023-05-27 17:39:23.638", phase: 2, voltage: 216.3, current: 2.6, powerActive: 101.8, powerReactive: 44.8, powerApparent: 64.7),
  PhaseReadings(id: 15, timestamp: "2023-05-27 17:44:23.638", phase: 2, voltage: 219.7, current: 2.4, powerActive: 86.2, powerReactive: 59.8, powerApparent: 43.0),
  PhaseReadings(id: 16, timestamp: "2023-05-27 17:49:23.638", phase: 2, voltage: 228.6, current: 2.5, powerActive: 104.4, powerReactive: 40.8, powerApparent: 37.3),
  PhaseReadings(id: 17, timestamp: "2023-05-27 17:54:23.638", phase: 2, voltage: 214.3, current: 2.2, powerActive: 113.1, powerReactive: 41.8, powerApparent: 68.3),
  PhaseReadings(id: 18, timestamp: "2023-05-27 17:59:23.638", phase: 2, voltage: 210.8, current: 2.2, powerActive: 80.7, powerReactive: 58.9, powerApparent: 59.4),
  PhaseReadings(id: 19, timestamp: "2023-05-27 18:04:23.638", phase: 2, voltage: 217.5, current: 2.4, powerActive: 113.8, powerReactive: 30.5, powerApparent: 67.2),
  PhaseReadings(id: 20, timestamp: "2023-05-27 18:09:23.639", phase: 2, voltage: 216.3, current: 2.1, powerActive: 95.2, powerReactive: 62.8, powerApparent: 52.8),
];

const phase3 = [
  PhaseReadings(id: 1, timestamp: "2023-05-27 16:34:59.204", phase: 3, voltage: 210.4, current: 2.6, powerActive: 98.4, powerReactive: 32.2, powerApparent: 35.0),
  PhaseReadings(id: 2, timestamp: "2023-05-27 16:39:59.205", phase: 3, voltage: 229.7, current: 2.3, powerActive: 103.2, powerReactive: 48.9, powerApparent: 50.3),
  PhaseReadings(id: 3, timestamp: "2023-05-27 16:44:59.205", phase: 3, voltage: 216.4, current: 2.4, powerActive: 108.6, powerReactive: 55.1, powerApparent: 35.8),
  PhaseReadings(id: 4, timestamp: "2023-05-27 16:49:59.205", phase: 3, voltage: 214.3, current: 2.2, powerActive: 111.8, powerReactive: 43.4, powerApparent: 40.4),
  PhaseReadings(id: 5, timestamp: "2023-05-27 16:54:59.205", phase: 3, voltage: 212.1, current: 2.6, powerActive: 97.8, powerReactive: 64.7, powerApparent: 58.2),
  PhaseReadings(id: 6, timestamp: "2023-05-27 16:59:59.205", phase: 3, voltage: 218.5, current: 2.1, powerActive: 90.8, powerReactive: 45.7, powerApparent: 54.2),
  PhaseReadings(id: 7, timestamp: "2023-05-27 17:04:59.205", phase: 3, voltage: 210.3, current: 2.7, powerActive: 91.4, powerReactive: 47.2, powerApparent: 41.8),
  PhaseReadings(id: 8, timestamp: "2023-05-27 17:09:59.205", phase: 3, voltage: 213.1, current: 2.1, powerActive: 93.8, powerReactive: 37.3, powerApparent: 39.9),
  PhaseReadings(id: 9, timestamp: "2023-05-27 17:14:59.205", phase: 3, voltage: 214.5, current: 2.8, powerActive: 117.2, powerReactive: 37.0, powerApparent: 45.0),
  PhaseReadings(id: 10, timestamp: "2023-05-27 17:19:59.205", phase: 3, voltage: 222.5, current: 2.3, powerActive: 80.5, powerReactive: 45.5, powerApparent: 32.4),
  PhaseReadings(id: 11, timestamp: "2023-05-27 17:24:59.205", phase: 3, voltage: 222.8, current: 2.6, powerActive: 87.8, powerReactive: 46.9, powerApparent: 69.0),
  PhaseReadings(id: 12, timestamp: "2023-05-27 17:29:59.205", phase: 3, voltage: 216.1, current: 2.2, powerActive: 82.4, powerReactive: 40.7, powerApparent: 33.8),
  PhaseReadings(id: 13, timestamp: "2023-05-27 17:34:59.205", phase: 3, voltage: 218.9, current: 2.7, powerActive: 109.0, powerReactive: 36.6, powerApparent: 53.6),
  PhaseReadings(id: 14, timestamp: "2023-05-27 17:39:59.206", phase: 3, voltage: 212.5, current: 2.2, powerActive: 111.6, powerReactive: 57.5, powerApparent: 63.2),
  PhaseReadings(id: 15, timestamp: "2023-05-27 17:44:59.206", phase: 3, voltage: 221.0, current: 2.7, powerActive: 84.3, powerReactive: 62.9, powerApparent: 49.2),
  PhaseReadings(id: 16, timestamp: "2023-05-27 17:49:59.206", phase: 3, voltage: 211.3, current: 2.7, powerActive: 96.2, powerReactive: 32.4, powerApparent: 37.7),
  PhaseReadings(id: 17, timestamp: "2023-05-27 17:54:59.206", phase: 3, voltage: 222.5, current: 2.8, powerActive: 111.4, powerReactive: 33.5, powerApparent: 65.8),
  PhaseReadings(id: 18, timestamp: "2023-05-27 17:59:59.206", phase: 3, voltage: 213.6, current: 2.6, powerActive: 84.3, powerReactive: 48.1, powerApparent: 57.6),
  PhaseReadings(id: 19, timestamp: "2023-05-27 18:04:59.206", phase: 3, voltage: 210.1, current: 2.3, powerActive: 81.7, powerReactive: 46.2, powerApparent: 34.6),
  PhaseReadings(id: 20, timestamp: "2023-05-27 18:09:59.206", phase: 3, voltage: 211.0, current: 2.2, powerActive: 86.4, powerReactive: 48.2, powerApparent: 53.7),
];

List<CombinedPhases> cbphases = [];

Future getCombinedPhases() async {
  cbphases = [];
  var result = await APIService.fetchCombinedPhases();
  for(final item in result.dataset) {
    cbphases.add(CombinedPhases(id: item[0], timestamp: item[1], phase1Id: item[2], phase2Id: item[3], phase3Id: item[4]));
  }
}

const combinedPhases = [
  CombinedPhases(id: 1, timestamp: "2023-05-27 16:33:04.047", phase1Id: 1, phase2Id: 1, phase3Id: 1),
  CombinedPhases(id: 2, timestamp: "2023-05-27 16:38:04.047", phase1Id: 2, phase2Id: 2, phase3Id: 2),
  CombinedPhases(id: 3, timestamp: "2023-05-27 16:43:04.047", phase1Id: 3, phase2Id: 3, phase3Id: 3),
  CombinedPhases(id: 4, timestamp: "2023-05-27 16:48:04.047", phase1Id: 4, phase2Id: 4, phase3Id: 4),
  CombinedPhases(id: 5, timestamp: "2023-05-27 16:53:04.047", phase1Id: 5, phase2Id: 5, phase3Id: 5),
  CombinedPhases(id: 6, timestamp: "2023-05-27 16:58:04.047", phase1Id: 6, phase2Id: 6, phase3Id: 6),
  CombinedPhases(id: 7, timestamp: "2023-05-27 17:03:04.047", phase1Id: 7, phase2Id: 7, phase3Id: 7),
  CombinedPhases(id: 8, timestamp: "2023-05-27 17:08:04.047", phase1Id: 8, phase2Id: 8, phase3Id: 8),
  CombinedPhases(id: 9, timestamp: "2023-05-27 17:13:04.047", phase1Id: 9, phase2Id: 9, phase3Id: 9),
  CombinedPhases(id: 10, timestamp: "2023-05-27 17:18:04.047", phase1Id: 10, phase2Id: 10, phase3Id: 10),
  CombinedPhases(id: 11, timestamp: "2023-05-27 17:23:04.047", phase1Id: 11, phase2Id: 11, phase3Id: 11),
  CombinedPhases(id: 12, timestamp: "2023-05-27 17:28:04.047", phase1Id: 12, phase2Id: 12, phase3Id: 12),
  CombinedPhases(id: 13, timestamp: "2023-05-27 17:33:04.047", phase1Id: 13, phase2Id: 13, phase3Id: 13),
  CombinedPhases(id: 14, timestamp: "2023-05-27 17:38:04.047", phase1Id: 14, phase2Id: 14, phase3Id: 14),
  CombinedPhases(id: 15, timestamp: "2023-05-27 17:43:04.048", phase1Id: 15, phase2Id: 15, phase3Id: 15),
  CombinedPhases(id: 16, timestamp: "2023-05-27 17:48:04.048", phase1Id: 16, phase2Id: 16, phase3Id: 16),
  CombinedPhases(id: 17, timestamp: "2023-05-27 17:53:04.048", phase1Id: 17, phase2Id: 17, phase3Id: 17),
  CombinedPhases(id: 18, timestamp: "2023-05-27 17:58:04.048", phase1Id: 18, phase2Id: 18, phase3Id: 18),
  CombinedPhases(id: 19, timestamp: "2023-05-27 18:03:04.048", phase1Id: 19, phase2Id: 19, phase3Id: 19),
  ];

const electricAvg = [
  ElectricAvg(id: 1, timestamp: "2023-05-27 16:37:47.870", currentDemand: 214.6, powerActiveDemand: 2.1, powerApparentDemand: 92.8),
  ElectricAvg(id: 2, timestamp: "2023-05-27 16:42:47.870", currentDemand: 229.3, powerActiveDemand: 2.2, powerApparentDemand: 112.8),
  ElectricAvg(id: 3, timestamp: "2023-05-27 16:47:47.870", currentDemand: 227.5, powerActiveDemand: 2.8, powerApparentDemand: 87.6),
  ElectricAvg(id: 4, timestamp: "2023-05-27 16:52:47.870", currentDemand: 211.1, powerActiveDemand: 2.1, powerApparentDemand: 88.1),
  ElectricAvg(id: 5, timestamp: "2023-05-27 16:57:47.871", currentDemand: 216.0, powerActiveDemand: 2.2, powerApparentDemand: 93.3),
  ElectricAvg(id: 6, timestamp: "2023-05-27 17:02:47.871", currentDemand: 219.0, powerActiveDemand: 2.8, powerApparentDemand: 92.1),
  ElectricAvg(id: 7, timestamp: "2023-05-27 17:07:47.871", currentDemand: 210.9, powerActiveDemand: 2.2, powerApparentDemand: 85.8),
  ElectricAvg(id: 8, timestamp: "2023-05-27 17:12:47.871", currentDemand: 220.1, powerActiveDemand: 2.1, powerApparentDemand: 100.3),
  ElectricAvg(id: 9, timestamp: "2023-05-27 17:17:47.871", currentDemand: 229.3, powerActiveDemand: 2.9, powerApparentDemand: 86.6),
  ElectricAvg(id: 10, timestamp: "2023-05-27 17:22:47.871", currentDemand: 223.8, powerActiveDemand: 2.8, powerApparentDemand: 88.6),
  ElectricAvg(id: 11, timestamp: "2023-05-27 17:27:47.871", currentDemand: 227.6, powerActiveDemand: 2.5, powerApparentDemand: 108.5),
  ElectricAvg(id: 12, timestamp: "2023-05-27 17:32:47.871", currentDemand: 223.9, powerActiveDemand: 2.6, powerApparentDemand: 91.7),
  ElectricAvg(id: 13, timestamp: "2023-05-27 17:37:47.871", currentDemand: 216.3, powerActiveDemand: 2.1, powerApparentDemand: 86.6),
  ElectricAvg(id: 14, timestamp: "2023-05-27 17:42:47.872", currentDemand: 227.9, powerActiveDemand: 2.2, powerApparentDemand: 101.6),
  ElectricAvg(id: 15, timestamp: "2023-05-27 17:47:47.872", currentDemand: 224.1, powerActiveDemand: 2.7, powerApparentDemand: 104.9),
  ElectricAvg(id: 16, timestamp: "2023-05-27 17:52:47.872", currentDemand: 210.5, powerActiveDemand: 2.1, powerApparentDemand: 112.3),
  ElectricAvg(id: 17, timestamp: "2023-05-27 17:57:47.872", currentDemand: 224.0, powerActiveDemand: 2.7, powerApparentDemand: 100.9),
  ElectricAvg(id: 18, timestamp: "2023-05-27 18:02:47.872", currentDemand: 212.6, powerActiveDemand: 2.2, powerApparentDemand: 106.5),
  ElectricAvg(id: 19, timestamp: "2023-05-27 18:07:47.872", currentDemand: 220.2, powerActiveDemand: 2.7, powerApparentDemand: 115.6),
  ElectricAvg(id: 20, timestamp: "2023-05-27 18:12:47.872", currentDemand: 227.6, powerActiveDemand: 2.2, powerApparentDemand: 92.5),
];

const waterReadings = [
  WaterReadings(id: 1, timestamp: "2023-05-21 06:30:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 2, timestamp: "2023-05-21 06:35:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 3, timestamp: "2023-05-21 06:40:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 4, timestamp: "2023-05-21 06:45:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 2, diverterPosition: 3),
  WaterReadings(id: 5, timestamp: "2023-05-21 06:50:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 6, timestamp: "2023-05-21 06:55:04.685", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 7, timestamp: "2023-05-21 07:00:04.685", pressureStatus: false, diverterStatus: false, oilStatus: false, waterStatus: false, waterLevel: 3, diverterPosition: 1),
  WaterReadings(id: 8, timestamp: "2023-05-21 07:05:04.686", pressureStatus: false, diverterStatus: false, oilStatus: false, waterStatus: false, waterLevel: 3, diverterPosition: 1),
  WaterReadings(id: 9, timestamp: "2023-05-21 07:10:04.686", pressureStatus: false, diverterStatus: false, oilStatus: true, waterStatus: true, waterLevel: 3, diverterPosition: 1),
  WaterReadings(id: 10, timestamp: "2023-05-21 07:15:04.686", pressureStatus: true, diverterStatus: true, oilStatus: true, waterStatus: true, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 11, timestamp: "2023-05-21 07:20:04.686", pressureStatus: true, diverterStatus: true, oilStatus: true, waterStatus: true, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 12, timestamp: "2023-05-21 07:25:04.686", pressureStatus: true, diverterStatus: true, oilStatus: true, waterStatus: true, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 13, timestamp: "2023-05-21 07:30:04.686", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 14, timestamp: "2023-05-21 07:35:04.686", pressureStatus: false, diverterStatus: false, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 4),
  WaterReadings(id: 15, timestamp: "2023-05-21 07:40:04.686", pressureStatus: false, diverterStatus: false, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 16, timestamp: "2023-05-21 07:45:04.686", pressureStatus: false, diverterStatus: false, oilStatus: false, waterStatus: false, waterLevel: 2, diverterPosition: 3),
  WaterReadings(id: 17, timestamp: "2023-05-21 07:50:04.686", pressureStatus: false, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 2, diverterPosition: 2),
  WaterReadings(id: 18, timestamp: "2023-05-21 07:55:04.686", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 19, timestamp: "2023-05-21 08:00:04.686", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
  WaterReadings(id: 20, timestamp: "2023-05-21 08:05:04.686", pressureStatus: true, diverterStatus: true, oilStatus: false, waterStatus: false, waterLevel: 1, diverterPosition: 3),
];  