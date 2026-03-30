import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/features/home/providers/destination_provider.dart';
import 'package:deep_north/features/home/providers/sensor_provider.dart';
import 'package:deep_north/features/home/widgets/mobile_header.dart';
import 'package:deep_north/features/home/widgets/filter_chips_row.dart';
import 'package:deep_north/features/home/widgets/destination_list.dart';
import 'package:deep_north/features/home/widgets/sensor_scroll.dart';
import 'package:deep_north/features/home/widgets/live_badge.dart';
import 'package:deep_north/shared/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DestinationProvider>().fetchDestinations();
      context.read<SensorProvider>().startListening();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sand,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(children: [
            SafeArea(
              bottom: false,
              child: Column(children: [
                const MobileHeader(),
                const WaveDivider(),
              ]),
            ),
            const SizedBox(height: 12),
            const FilterChipsRow(),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Destinasi Populer',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/destinations'),
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.aquaDim,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DestinationList(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                    Text(
                      'Kondisi Laut',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark,
                      ),
                    ),
                    SizedBox(width: 8),
                    Row(children: [
                      LiveDot(),
                      SizedBox(width: 4),
                      Text(
                        'Real-time',
                        style: TextStyle(
                          fontSize: 9,
                          color: AppColors.aquaDim,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ]),
                  GestureDetector(
                    onTap: () => context.push('/monitoring'),
                    child: const Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.aquaDim,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SensorScroll(),
            ),
            const SizedBox(height: 24),
          ]),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
