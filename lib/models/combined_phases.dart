class CombinedPhases {
  const CombinedPhases({
    required this.id,
    required this.timestamp,
    required this.phase1Id,
    required this.phase2Id,
    required this.phase3Id,
  });

  final int id;
  final String timestamp;
  final int phase1Id;
  final int phase2Id;
  final int phase3Id;
}