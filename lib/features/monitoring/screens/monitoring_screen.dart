import 'package:flutter/material.dart';
import 'package:deep_north/shared/widgets/bottom_nav_bar.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Monitoring Kondisi Laut')),
      bottomNavigationBar: AppBottomNavBar(currentIndex: 3),
    );
  }
}
