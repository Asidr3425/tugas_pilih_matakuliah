import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';
import '../viewmodels/selection_viewmodel.dart';
import '../widgets/course_card.dart';
import '../widgets/course_detail_sheet.dart';
import 'my_courses_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key, required this.viewModel});

  final SelectionViewModel viewModel;

  void _openDetail(BuildContext context, Course course) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => CourseDetailSheet(
        course: course,
        selected: viewModel.isSelected(course),
        onToggle: () {
          viewModel.toggle(course);
          Navigator.of(sheetContext).pop();
        },
      ),
    );
  }

  void _openMyCourses(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => MyCoursesScreen(viewModel: viewModel),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            final courses = viewModel.courses;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(
                  count: viewModel.selectedCount,
                  sks: viewModel.totalSks,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CourseCard(
                          course: course,
                          selected: viewModel.isSelected(course),
                          onOpen: () => _openDetail(context, course),
                          onToggle: () => viewModel.toggle(course),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: FilledButton(
                    onPressed: () => _openMyCourses(context),
                    child: const Text('Mata Kuliah Saya'),
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

class _Header extends StatelessWidget {
  const _Header({required this.count, required this.sks});

  final int count;
  final int sks;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Semester 5',
            style: text.labelMedium?.copyWith(color: KurasiColors.sage),
          ),
          const SizedBox(height: 2),
          Text('Pilih Mata Kuliah', style: text.headlineMedium),
          const SizedBox(height: 4),
          Text(
            '$count Mata Kuliah · $sks SKS',
            style: text.bodySmall?.copyWith(color: KurasiColors.inkSoft),
          ),
        ],
      ),
    );
  }
}
