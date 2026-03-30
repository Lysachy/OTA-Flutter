import 'package:flutter/material.dart';
import 'package:deep_north/shared/widgets/bottom_nav_bar.dart';

class BookingScreen extends StatelessWidget {
  final String destinationId;
  const BookingScreen({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: Center(child: Text('Booking untuk destinasi: $destinationId')),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }
}
