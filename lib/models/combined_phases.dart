class CombinedPhase {
  const CombinedPhase({
    required this.timestamp,
    required this.voltageAvg,
    required this.currentAvg,
    required this.powerActiveAvg,
    required this.powerReactiveAvg,
    required this.powerApparentAvg,
  });

  final String timestamp;
  final double voltageAvg;
  final double currentAvg;
  final double powerActiveAvg;
  final double powerReactiveAvg;
  final double powerApparentAvg;
}