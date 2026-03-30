import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deep_north/core/theme/app_theme.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const firstName = 'Penyelam';

    return Container(
      color: AppColors.ocean,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat datang \u{1F30A}',
                      style: TextStyle(fontSize: 11, color: Colors.white54),
                    ),
                    Text(
                      'Halo, $firstName!',
                      style: GoogleFonts.fraunces(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(children: [
                const _IconBtn(icon: Icons.notifications_outlined),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.aqua,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.ocean, width: 1.5),
                    ),
                  ),
                ),
              ]),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.aqua.withValues(alpha: 0.2),
                child: Text(
                  firstName.isNotEmpty ? firstName[0].toUpperCase() : 'U',
                  style: const TextStyle(
                    color: AppColors.aqua,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(children: [
              const Icon(Icons.search, size: 16, color: Colors.white38),
              const SizedBox(width: 9),
              const Expanded(
                child: Text(
                  'Cari destinasi selam...',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    const Icon(Icons.tune, size: 14, color: Colors.white54),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  const _IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: Colors.white70),
    );
  }
}

class WaveDivider extends StatelessWidget {
  const WaveDivider({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 18,
        decoration: const BoxDecoration(
          color: AppColors.sand,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
      );
}
