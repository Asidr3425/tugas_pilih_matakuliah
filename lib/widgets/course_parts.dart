import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Ikon mata kuliah di kotak lembut.
class CourseIconBox extends StatelessWidget {
  const CourseIconBox({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: KurasiColors.surface2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 22, color: KurasiColors.sage),
    );
  }
}

/// Label kecil: SKS atau jenis mata kuliah.
class InfoPill extends StatelessWidget {
  const InfoPill(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: KurasiColors.surface2,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
        child: Text(label, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}

/// Satu baris info: ikon = makna, teks pendek.
class MetaRow extends StatelessWidget {
  const MetaRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: KurasiColors.inkSoft),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: KurasiColors.inkSoft),
          ),
        ),
      ],
    );
  }
}
