import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/shared/models/sensor_model.dart';
import 'package:deep_north/features/home/providers/sensor_provider.dart';

class SensorConfig {
  final String key;
  final String label;
  final String unit;
  final Color iconBg;
  final Color iconColor;
  final IconData icon;
  final String Function(SensorModel) getStatus;
  final double Function(SensorModel) getValue;

  const SensorConfig({
    required this.key,
    required this.label,
    required this.unit,
    required this.iconBg,
    required this.iconColor,
    required this.icon,
    required this.getStatus,
    required this.getValue,
  });
}

final List<SensorConfig> sensorConfigs = [
  SensorConfig(
    key: 'waveHeight',
    label: 'Gelombang',
    unit: 'm',
    iconBg: const Color(0xFFE0F7FD),
    iconColor: const Color(0xFF0891B2),
    icon: Icons.waves,
    getValue: (s) => s.waveHeight,
    getStatus: (s) => s.waveStatus(),
  ),
  SensorConfig(
    key: 'waterTemp',
    label: 'Suhu Air',
    unit: '\u00B0C',
    iconBg: const Color(0xFFFFF0E5),
    iconColor: const Color(0xFFEA580C),
    icon: Icons.thermostat,
    getValue: (s) => s.waterTemp,
    getStatus: (s) => s.tempStatus(),
  ),
  SensorConfig(
    key: 'visibility',
    label: 'Visibilitas',
    unit: 'm',
    iconBg: const Color(0xFFE0FAF5),
    iconColor: const Color(0xFF0D9488),
    icon: Icons.visibility,
    getValue: (s) => s.visibility,
    getStatus: (s) => s.visStatus(),
  ),
  SensorConfig(
    key: 'ph',
    label: 'pH Air',
    unit: '',
    iconBg: const Color(0xFFF0E8FF),
    iconColor: const Color(0xFF7C3AED),
    icon: Icons.science,
    getValue: (s) => s.ph,
    getStatus: (s) => s.phStatus(),
  ),
  SensorConfig(
    key: 'windSpeed',
    label: 'Angin',
    unit: 'km/h',
    iconBg: const Color(0xFFFFF8E0),
    iconColor: const Color(0xFFD97706),
    icon: Icons.air,
    getValue: (s) => s.windSpeed,
    getStatus: (s) => s.windStatus(),
  ),
];

class SensorScroll extends StatelessWidget {
  const SensorScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final sensor = context.watch<SensorProvider>().sensor;
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sensorConfigs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (_, i) {
          final cfg = sensorConfigs[i];
          final value = sensor != null ? cfg.getValue(sensor) : null;
          final status = sensor != null ? cfg.getStatus(sensor) : '\u2014';
          final isOk =
              ['Aman', 'Ideal', 'Baik', 'Normal'].contains(status);
          return Container(
            width: 88,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.sandBorder, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: cfg.iconBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(cfg.icon, size: 14, color: cfg.iconColor),
                ),
                const SizedBox(height: 5),
                Text(
                  cfg.label,
                  style:
                      const TextStyle(fontSize: 9, color: AppColors.muted),
                ),
                const SizedBox(height: 2),
                value == null
                    ? Container(
                        height: 14,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.sand,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          text: value.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.dark,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${cfg.unit}',
                              style: const TextStyle(
                                fontSize: 9,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isOk
                        ? const Color(0xFFCCFBF1)
                        : const Color(0xFFFEF9C3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: isOk
                          ? const Color(0xFF0F766E)
                          : const Color(0xFF854D0E),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
