import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/features/home/providers/destination_provider.dart';
import 'package:deep_north/features/home/widgets/destination_card.dart';
import 'package:deep_north/shared/widgets/skeleton_card.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<DestinationProvider>();
    if (prov.isLoading) {
      return Column(
        children: List.generate(
          3,
          (_) => const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SkeletonCard(height: 96),
          ),
        ),
      );
    }
    if (prov.filtered.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Tidak ada destinasi ditemukan',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: prov.filtered.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) => DestinationCard(dest: prov.filtered[i]),
    );
  }
}
