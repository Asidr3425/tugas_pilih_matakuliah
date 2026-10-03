import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import 'course_parts.dart';

/// Isi BottomSheet detail: ikon, kode, nama, SKS, jenis, dosen, jadwal, ruang,
/// deskripsi singkat, dan satu aksi.
class CourseDetailSheet extends StatelessWidget {
  const CourseDetailSheet({
    super.key,
    required this.course,
    required this.selected,
    required this.onToggle,
  });

  final Course course;
  final bool selected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseIconBox(icon: course.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.code,
                        style: text.labelSmall?.copyWith(
                          color: KurasiColors.sage,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(course.name, style: text.headlineSmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                InfoPill('${course.sks} SKS'),
                const SizedBox(width: 8),
                InfoPill(course.type.label),
              ],
            ),
            const SizedBox(height: 16),
            MetaRow(icon: Icons.person_outline, text: course.lecturer),
            const SizedBox(height: 8),
            MetaRow(icon: Icons.schedule, text: course.schedule),
            const SizedBox(height: 8),
            MetaRow(icon: Icons.meeting_room_outlined, text: course.room),
            const SizedBox(height: 16),
            Text(course.description, style: text.bodyLarge),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onToggle,
                style: selected ? secondaryButtonStyle : null,
                child: Text(selected ? 'Batal Ambil' : 'Ambil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
