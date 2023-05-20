class Devices {
  const Devices({
    required this.id,
    required this.modbusAddress,
    required this.ip,
    required this.deviceType,
  });

  final int id;
  final int modbusAddress;
  final String ip;
  final int deviceType;
}