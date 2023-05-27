class ElectricAvg {
  const ElectricAvg({
    required this.id,
    required this.timestamp,
    required this.currentDemand,
    required this.powerActiveDemand,
    required this.powerApparentDemand,
  });

  final int id;
  final String timestamp;
  final double currentDemand;
  final double powerActiveDemand;
  final double powerApparentDemand;
}