import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import 'course_parts.dart';

/// Kartu mata kuliah di katalog. Ketuk kartu = detail, ketuk tombol = ambil/lepas.
class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.selected,
    required this.onOpen,
    required this.onToggle,
  });

  final Course course;
  final bool selected;
  final VoidCallback onOpen;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: selected ? KurasiColors.sageTint : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: selected
            ? const BorderSide(color: KurasiColors.sage, width: 1.5)
            : BorderSide.none,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: onOpen,
            isThreeLine: true,
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            leading: CourseIconBox(icon: course.icon),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.code,
                  style: text.labelSmall?.copyWith(color: KurasiColors.sage),
                ),
                const SizedBox(height: 2),
                Text(course.name, style: text.headlineSmall),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MetaRow(icon: Icons.person_outline, text: course.lecturer),
                  const SizedBox(height: 4),
                  MetaRow(icon: Icons.schedule, text: course.schedule),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      InfoPill('${course.sks} SKS'),
                      InfoPill(course.type.label),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _ActionButton(selected: selected, onPressed: onToggle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "Ambil" -> "Diambil" + ikon centang, sehingga status tidak hanya lewat warna.
class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.selected, required this.onPressed});

  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: selected ? null : secondaryButtonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selected) ...[
            const Icon(Icons.check, size: 18),
            const SizedBox(width: 6),
          ],
          Text(selected ? 'Diambil' : 'Ambil'),
        ],
      ),
    );
  }
}
