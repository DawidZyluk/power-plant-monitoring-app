class PhaseReadings {
  const PhaseReadings({
    required this.id,
    required this.timestamp,
    required this.phase,
    required this.voltage,
    required this.current,
    required this.powerActive,
    required this.powerReactive,
    required this.powerApparent,
  });

  final int id;
  final String timestamp;
  final int phase;
  final double voltage;
  final double current;
  final double powerActive;
  final double powerReactive;
  final double powerApparent;
}