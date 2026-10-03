import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import '../viewmodels/selection_viewmodel.dart';
import '../widgets/course_parts.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key, required this.viewModel});

  final SelectionViewModel viewModel;

  Future<void> _confirmSave(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Simpan pilihan mata kuliah?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pilihan tersimpan')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mata Kuliah Saya')),
      body: SafeArea(
        top: false,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            final courses = viewModel.selectedCourses;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (courses.isEmpty)
                  const Expanded(child: _EmptyState())
                else ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                    child: Text(
                      '${viewModel.selectedCount} Mata Kuliah · ${viewModel.totalSks} SKS',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      itemCount: courses.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _SelectedCourseTile(course: courses[index]),
                      ),
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: FilledButton(
                    onPressed: courses.isEmpty
                        ? null
                        : () => _confirmSave(context),
                    child: const Text('Tinjau & Simpan'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SelectedCourseTile extends StatelessWidget {
  const _SelectedCourseTile({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: CourseIconBox(icon: course.icon),
        title: Text(course.name),
        subtitle: Text(
          '${course.code} · ${course.sks} SKS · ${course.type.label}\n'
          '${course.schedule}',
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.menu_book_outlined,
              size: 48,
              color: KurasiColors.sage,
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada mata kuliah dipilih',
              style: text.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Kembali ke katalog untuk memilih.',
              style: text.bodyMedium?.copyWith(color: KurasiColors.inkSoft),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
