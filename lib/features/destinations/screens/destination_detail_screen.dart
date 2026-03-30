import 'package:flutter/material.dart';
import 'package:deep_north/shared/widgets/bottom_nav_bar.dart';

class DestinationListScreen extends StatelessWidget {
  const DestinationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Daftar Destinasi')),
      bottomNavigationBar: AppBottomNavBar(currentIndex: 1),
    );
  }
}

class DestinationDetailScreen extends StatelessWidget {
  final String id;
  const DestinationDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Destinasi')),
      body: Center(child: Text('Destinasi ID: $id')),
    );
  }
}
