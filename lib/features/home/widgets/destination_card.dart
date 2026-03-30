import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deep_north/core/theme/app_theme.dart';
import 'package:deep_north/shared/models/destination_model.dart';
import 'package:deep_north/shared/utils/format_helper.dart';
import 'package:deep_north/features/home/widgets/live_badge.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel dest;
  const DestinationCard({super.key, required this.dest});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/destinations/${dest.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.sandBorder, width: 0.5),
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(children: [
          Container(
            width: 86,
            height: 96,
            color: Color(int.parse(dest.thumbColor)),
            alignment: Alignment.center,
            child: Text(dest.emoji, style: const TextStyle(fontSize: 30)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dest.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(children: [
                    const Icon(Icons.location_on,
                        size: 9, color: AppColors.muted),
                    const SizedBox(width: 2),
                    Text(
                      dest.location,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.muted),
                    ),
                  ]),
                  const SizedBox(height: 7),
                  Wrap(spacing: 4, runSpacing: 4, children: [
                    if (dest.isLive) const _LiveTag(),
                    ...dest.tags.map((t) => _Tag(label: t)),
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mulai dari',
                              style: TextStyle(
                                  fontSize: 9, color: AppColors.muted),
                            ),
                            Text(
                              formatRupiah(dest.priceStart),
                              style: GoogleFonts.fraunces(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ocean,
                              ),
                            ),
                          ]),
                      _BookBtn(
                          onTap: () =>
                              context.push('/booking/${dest.id}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _LiveTag extends StatelessWidget {
  const _LiveTag();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: const Color(0xFFCCFBF1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          LiveDot(),
          SizedBox(width: 3),
          Text(
            'LIVE',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xFF0F766E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ]),
      );
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.sand,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 9, color: AppColors.muted),
        ),
      );
}

class _BookBtn extends StatelessWidget {
  final VoidCallback onTap;
  const _BookBtn({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.ocean,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Pesan',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
