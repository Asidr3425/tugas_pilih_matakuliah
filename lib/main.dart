import 'package:flutter/material.dart';

import 'data/course_repository.dart';
import 'screens/catalog_screen.dart';
import 'theme/app_theme.dart';
import 'viewmodels/selection_viewmodel.dart';

void main() {
  runApp(KurasiApp(viewModel: SelectionViewModel(const CourseRepository())));
}

class KurasiApp extends StatelessWidget {
  const KurasiApp({super.key, required this.viewModel});

  final SelectionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KURASI',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: CatalogScreen(viewModel: viewModel),
    );
  }
}
