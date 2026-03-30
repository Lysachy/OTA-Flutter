import 'dart:async';
import 'package:flutter/material.dart';
import 'package:deep_north/shared/models/sensor_model.dart';

class SensorProvider extends ChangeNotifier {
  SensorModel? sensor;
  Timer? _timer;
  int _tick = 0;

  void startListening() {
    sensor = SensorModel.fromMap(_demoSnapshots.first);
    notifyListeners();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      _tick = (_tick + 1) % _demoSnapshots.length;
      sensor = SensorModel.fromMap(_demoSnapshots[_tick]);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final List<Map<String, dynamic>> _demoSnapshots = [
  {
    'waveHeight': 0.6,
    'waterTemp': 27.4,
    'visibility': 18.0,
    'ph': 8.1,
    'windSpeed': 12.0,
    'updatedAt': DateTime.now(),
  },
  {
    'waveHeight': 0.8,
    'waterTemp': 28.1,
    'visibility': 16.5,
    'ph': 8.0,
    'windSpeed': 18.0,
    'updatedAt': DateTime.now(),
  },
  {
    'waveHeight': 1.1,
    'waterTemp': 29.0,
    'visibility': 13.2,
    'ph': 7.8,
    'windSpeed': 22.0,
    'updatedAt': DateTime.now(),
  },
];
