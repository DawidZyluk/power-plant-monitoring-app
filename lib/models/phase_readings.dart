class Phase {
  const Phase({
    required this.id,
    required this.voltage,
    required this.current,
    required this.powerActive,
    required this.powerReactive,
  });

  final int id;
  final double voltage;
  final double current;
  final double powerActive;
  final double powerReactive;
}