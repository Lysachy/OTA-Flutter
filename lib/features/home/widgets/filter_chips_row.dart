import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/features/home/providers/destination_provider.dart';

class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<DestinationProvider>();
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: prov.filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (_, i) {
          final f = prov.filters[i];
          final isActive = prov.activeFilter == f;
          return GestureDetector(
            onTap: () => prov.setFilter(f),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? AppColors.ocean : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isActive ? AppColors.ocean : AppColors.sandBorder,
                ),
              ),
              child: Text(
                f,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : AppColors.muted,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
