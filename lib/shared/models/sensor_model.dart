class SensorModel {
  final double waveHeight;
  final double waterTemp;
  final double visibility;
  final double ph;
  final double windSpeed;
  final DateTime updatedAt;

  const SensorModel({
    required this.waveHeight,
    required this.waterTemp,
    required this.visibility,
    required this.ph,
    required this.windSpeed,
    required this.updatedAt,
  });

  factory SensorModel.fromMap(Map<String, dynamic> data) {
    return SensorModel(
      waveHeight: (data['waveHeight'] ?? 0).toDouble(),
      waterTemp: (data['waterTemp'] ?? 0).toDouble(),
      visibility: (data['visibility'] ?? 0).toDouble(),
      ph: (data['ph'] ?? 7).toDouble(),
      windSpeed: (data['windSpeed'] ?? 0).toDouble(),
      updatedAt: data['updatedAt'] as DateTime? ?? DateTime.now(),
    );
  }

  String waveStatus() => waveHeight < 0.8 ? 'Aman' : 'Berbahaya';
  String tempStatus() =>
      waterTemp >= 25 && waterTemp <= 30 ? 'Ideal' : 'Perhatian';
  String visStatus() => visibility >= 15 ? 'Baik' : 'Perhatian';
  String phStatus() => ph >= 7.5 && ph <= 8.5 ? 'Normal' : 'Perhatian';
  String windStatus() => windSpeed < 20 ? 'Normal' : 'Kencang';
}
