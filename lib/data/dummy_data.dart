import 'package:flutter/material.dart';

import 'package:mewa/models/category.dart';
import 'package:mewa/models/electric_readings.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/models/water_readings.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Odczyty 1 fazy',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Odczyty 2 fazy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Odczyty 3 fazy',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Odczyty prądu',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Odczyty wody',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Urządzenia',
    color: Colors.green,
  ),
];

const phase1 = [
  PhaseReadings(id: 1, voltage: 223.7, current: 2.7, powerActive: 119.1, powerReactive: 54.5),
  PhaseReadings(id: 2, voltage: 222.3, current: 2.8, powerActive: 85.5, powerReactive: 55.2),
  PhaseReadings(id: 3, voltage: 225.3, current: 2.3, powerActive: 119.3, powerReactive: 31.0),
  PhaseReadings(id: 4, voltage: 223.3, current: 2.1, powerActive: 84.4, powerReactive: 66.0),
  PhaseReadings(id: 5, voltage: 226.4, current: 2.8, powerActive: 87.8, powerReactive: 56.6),
  PhaseReadings(id: 6, voltage: 225.9, current: 2.5, powerActive: 105.5, powerReactive: 42.1),
  PhaseReadings(id: 7, voltage: 218.9, current: 2.5, powerActive: 85.7, powerReactive: 61.1),
  PhaseReadings(id: 8, voltage: 211.6, current: 2.4, powerActive: 89.5, powerReactive: 35.5),
  PhaseReadings(id: 9, voltage: 228.6, current: 2.6, powerActive: 102.3, powerReactive: 30.6),
  PhaseReadings(id: 10, voltage: 213.9, current: 2.3, powerActive: 102.1, powerReactive: 53.4),
  PhaseReadings(id: 11, voltage: 228.9, current: 2.0, powerActive: 114.9, powerReactive: 62.6),
  PhaseReadings(id: 12, voltage: 213.3, current: 2.8, powerActive: 87.1, powerReactive: 56.0),
  PhaseReadings(id: 13, voltage: 215.6, current: 2.8, powerActive: 113.5, powerReactive: 33.8),
  PhaseReadings(id: 14, voltage: 213.4, current: 3.0, powerActive: 101.7, powerReactive: 63.9),
  PhaseReadings(id: 15, voltage: 221.8, current: 2.5, powerActive: 83.8, powerReactive: 52.4),
  PhaseReadings(id: 16, voltage: 223.0, current: 2.1, powerActive: 108.4, powerReactive: 50.7),
  PhaseReadings(id: 17, voltage: 229.9, current: 2.0, powerActive: 113.1, powerReactive: 55.2),
  PhaseReadings(id: 18, voltage: 222.1, current: 2.3, powerActive: 82.2, powerReactive: 39.2),
  PhaseReadings(id: 19, voltage: 224.1, current: 2.4, powerActive: 119.4, powerReactive: 54.0),
  PhaseReadings(id: 20, voltage: 219.5, current: 2.4, powerActive: 98.6, powerReactive: 55.2),
];

const phase2 = [
  PhaseReadings(id: 1, voltage: 213.5, current: 2.9, powerActive: 83.1, powerReactive: 37.6),
  PhaseReadings(id: 2, voltage: 226.4, current: 2.6, powerActive: 92.4, powerReactive: 64.2),
  PhaseReadings(id: 3, voltage: 216.8, current: 2.7, powerActive: 104.2, powerReactive: 67.7),
  PhaseReadings(id: 4, voltage: 219.0, current: 2.1, powerActive: 107.3, powerReactive: 51.8),
  PhaseReadings(id: 5, voltage: 221.5, current: 2.8, powerActive: 97.3, powerReactive: 45.6),
  PhaseReadings(id: 6, voltage: 215.3, current: 2.2, powerActive: 97.5, powerReactive: 59.1),
  PhaseReadings(id: 7, voltage: 227.3, current: 2.6, powerActive: 103.8, powerReactive: 33.7),
  PhaseReadings(id: 8, voltage: 212.5, current: 2.5, powerActive: 108.7, powerReactive: 68.4),
  PhaseReadings(id: 9, voltage: 223.0, current: 3.0, powerActive: 103.1, powerReactive: 38.8),
  PhaseReadings(id: 10, voltage: 216.6, current: 2.2, powerActive: 115.9, powerReactive: 33.9),
  PhaseReadings(id: 11, voltage: 222.0, current: 2.5, powerActive: 95.7, powerReactive: 66.1),
  PhaseReadings(id: 12, voltage: 221.2, current: 2.8, powerActive: 99.1, powerReactive: 54.6),
  PhaseReadings(id: 13, voltage: 211.7, current: 2.0, powerActive: 99.7, powerReactive: 47.7),
  PhaseReadings(id: 14, voltage: 221.6, current: 3.0, powerActive: 83.2, powerReactive: 50.6),
  PhaseReadings(id: 15, voltage: 217.3, current: 2.9, powerActive: 119.5, powerReactive: 63.9),
  PhaseReadings(id: 16, voltage: 225.6, current: 2.4, powerActive: 80.2, powerReactive: 33.7),
  PhaseReadings(id: 17, voltage: 224.0, current: 2.1, powerActive: 98.7, powerReactive: 45.1),
  PhaseReadings(id: 18, voltage: 229.3, current: 2.0, powerActive: 91.4, powerReactive: 46.9),
  PhaseReadings(id: 19, voltage: 222.3, current: 2.2, powerActive: 103.3, powerReactive: 67.7),
  PhaseReadings(id: 20, voltage: 214.6, current: 2.8, powerActive: 92.3, powerReactive: 45.3),
];

const phase3 = [
  PhaseReadings(id: 1, voltage: 214.1, current: 2.6, powerActive: 106.8, powerReactive: 30.8),
  PhaseReadings(id: 2, voltage: 228.5, current: 2.7, powerActive: 102.6, powerReactive: 62.1),
  PhaseReadings(id: 3, voltage: 213.9, current: 2.1, powerActive: 91.6, powerReactive: 30.7),
  PhaseReadings(id: 4, voltage: 211.2, current: 2.8, powerActive: 88.1, powerReactive: 62.9),
  PhaseReadings(id: 5, voltage: 220.9, current: 2.8, powerActive: 88.4, powerReactive: 39.2),
  PhaseReadings(id: 6, voltage: 215.4, current: 2.4, powerActive: 101.9, powerReactive: 36.5),
  PhaseReadings(id: 7, voltage: 227.5, current: 2.8, powerActive: 88.6, powerReactive: 67.7),
  PhaseReadings(id: 8, voltage: 224.3, current: 2.3, powerActive: 102.5, powerReactive: 32.2),
  PhaseReadings(id: 9, voltage: 217.9, current: 2.2, powerActive: 92.5, powerReactive: 61.2),
  PhaseReadings(id: 10, voltage: 225.8, current: 2.9, powerActive: 88.2, powerReactive: 60.2),
  PhaseReadings(id: 11, voltage: 213.6, current: 2.8, powerActive: 99.8, powerReactive: 33.5),
  PhaseReadings(id: 12, voltage: 218.4, current: 2.5, powerActive: 116.5, powerReactive: 58.1),
  PhaseReadings(id: 13, voltage: 210.6, current: 2.3, powerActive: 81.3, powerReactive: 64.6),
  PhaseReadings(id: 14, voltage: 215.3, current: 2.9, powerActive: 89.9, powerReactive: 67.5),
  PhaseReadings(id: 15, voltage: 218.5, current: 2.4, powerActive: 108.4, powerReactive: 42.6),
  PhaseReadings(id: 16, voltage: 220.8, current: 2.4, powerActive: 91.8, powerReactive: 60.9),
  PhaseReadings(id: 17, voltage: 221.5, current: 2.3, powerActive: 96.1, powerReactive: 62.6),
  PhaseReadings(id: 18, voltage: 215.0, current: 2.9, powerActive: 101.3, powerReactive: 55.6),
  PhaseReadings(id: 19, voltage: 214.0, current: 2.5, powerActive: 94.9, powerReactive: 34.8),
  PhaseReadings(id: 20, voltage: 223.7, current: 2.2, powerActive: 83.8, powerReactive: 57.0),
];

const electricReadings = [
  ElectricReadings(id: 1, timestamp: "2023-05-21 06:30:04.685", phase1Id: 1, phase2Id: 1, phase3Id: 1, powerActiveAvg: 39.4),
  ElectricReadings(id: 2, timestamp: "2023-05-21 06:35:04.685", phase1Id: 2, phase2Id: 2, phase3Id: 2, powerActiveAvg: 38.4),
  ElectricReadings(id: 3, timestamp: "2023-05-21 06:40:04.685", phase1Id: 3, phase2Id: 3, phase3Id: 3, powerActiveAvg: 47.4),
  ElectricReadings(id: 4, timestamp: "2023-05-21 06:45:04.685", phase1Id: 4, phase2Id: 4, phase3Id: 4, powerActiveAvg: 42.7),
  ElectricReadings(id: 5, timestamp: "2023-05-21 06:50:04.685", phase1Id: 5, phase2Id: 5, phase3Id: 5, powerActiveAvg: 43.3),
  ElectricReadings(id: 6, timestamp: "2023-05-21 06:55:04.685", phase1Id: 6, phase2Id: 6, phase3Id: 6, powerActiveAvg: 49.4),
  ElectricReadings(id: 7, timestamp: "2023-05-21 07:00:04.685", phase1Id: 7, phase2Id: 7, phase3Id: 7, powerActiveAvg: 36.6),
  ElectricReadings(id: 8, timestamp: "2023-05-21 07:05:04.686", phase1Id: 8, phase2Id: 8, phase3Id: 8, powerActiveAvg: 39.7),
  ElectricReadings(id: 9, timestamp: "2023-05-21 07:10:04.686", phase1Id: 9, phase2Id: 9, phase3Id: 9, powerActiveAvg: 40.6),
  ElectricReadings(id: 10, timestamp: "2023-05-21 07:15:04.686", phase1Id: 10, phase2Id: 10, phase3Id: 10, powerActiveAvg: 48.4),
  ElectricReadings(id: 11, timestamp: "2023-05-21 07:20:04.686", phase1Id: 11, phase2Id: 11, phase3Id: 11, powerActiveAvg: 43.9),
  ElectricReadings(id: 12, timestamp: "2023-05-21 07:25:04.686", phase1Id: 12, phase2Id: 12, phase3Id: 12, powerActiveAvg: 37.5),
  ElectricReadings(id: 13, timestamp: "2023-05-21 07:30:04.686", phase1Id: 13, phase2Id: 13, phase3Id: 13, powerActiveAvg: 40.4),
  ElectricReadings(id: 14, timestamp: "2023-05-21 07:35:04.686", phase1Id: 14, phase2Id: 14, phase3Id: 14, powerActiveAvg: 39.4),
  ElectricReadings(id: 15, timestamp: "2023-05-21 07:40:04.686", phase1Id: 15, phase2Id: 15, phase3Id: 15, powerActiveAvg: 42.3),
  ElectricReadings(id: 16, timestamp: "2023-05-21 07:45:04.686", phase1Id: 16, phase2Id: 16, phase3Id: 16, powerActiveAvg: 43.9),
  ElectricReadings(id: 17, timestamp: "2023-05-21 07:50:04.686", phase1Id: 17, phase2Id: 17, phase3Id: 17, powerActiveAvg: 36.7),
  ElectricReadings(id: 18, timestamp: "2023-05-21 07:55:04.686", phase1Id: 18, phase2Id: 18, phase3Id: 18, powerActiveAvg: 40.2),
  ElectricReadings(id: 19, timestamp: "2023-05-21 08:00:04.686", phase1Id: 19, phase2Id: 19, phase3Id: 19, powerActiveAvg: 42.8),
  ElectricReadings(id: 20, timestamp: "2023-05-21 08:05:04.686", phase1Id: 20, phase2Id: 20, phase3Id: 20, powerActiveAvg: 42.3),
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