import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deep_north/core/theme/app_theme.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const AppBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    const items = [
      (label: 'Beranda', icon: Icons.home_outlined, href: '/'),
      (label: 'Destinasi', icon: Icons.explore_outlined, href: '/destinations'),
      (label: 'Booking', icon: Icons.calendar_today, href: '/booking'),
      (label: 'Monitor', icon: Icons.sensors, href: '/monitoring'),
      (label: 'Profil', icon: Icons.person_outline, href: '/profile'),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border:
            Border(top: BorderSide(color: AppColors.sandBorder, width: 0.5)),
      ),
      padding: const EdgeInsets.only(bottom: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isActive = i == currentIndex;
          final isCenter = i == 2;

          if (isCenter) {
            return GestureDetector(
              onTap: () => context.go(item.href),
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppColors.ocean,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.sand, width: 3),
                ),
                child: Icon(item.icon, color: Colors.white, size: 20),
              ),
            );
          }

          return GestureDetector(
            onTap: () => context.go(item.href),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.ocean : AppColors.sandBorder,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(item.icon,
                    size: 13,
                    color: isActive ? Colors.white : AppColors.muted),
              ),
              const SizedBox(height: 3),
              Text(item.label,
                  style: TextStyle(
                    fontSize: 9,
                    color: isActive ? AppColors.ocean : AppColors.muted,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  )),
            ]),
          );
        }),
      ),
    );
  }
}
