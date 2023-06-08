class ElectricAvg {
  const ElectricAvg({
    required this.timestamp,
    required this.currentDemand,
    required this.powerActiveDemand,
    required this.powerApparentDemand,
  });

  final String timestamp;
  final double currentDemand;
  final double powerActiveDemand;
  final double powerApparentDemand;
}