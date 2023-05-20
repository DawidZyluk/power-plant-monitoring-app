class WaterReadings {
  const WaterReadings({
    required this.id,
    required this.timestamp,
    required this.pressureStatus,
    required this.diverterStatus,
    required this.oilStatus,
    required this.waterStatus,
    required this.waterLevel,
    required this.diverterPosition,
  });

  final int id;
  final String timestamp;
  final bool pressureStatus;
  final bool diverterStatus;
  final bool oilStatus;
  final bool waterStatus;
  final int waterLevel;
  final int diverterPosition;
}