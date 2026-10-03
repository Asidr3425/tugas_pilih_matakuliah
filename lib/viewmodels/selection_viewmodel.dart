import 'package:flutter/foundation.dart';

import '../data/course_repository.dart';
import '../models/course.dart';

/// Satu-satunya state pilihan. Jumlah dan total SKS diturunkan dari sini.
class SelectionViewModel extends ChangeNotifier {
  SelectionViewModel(this._repository);

  final CourseRepository _repository;
  final Set<String> _selectedCodes = {};

  List<Course> get courses => _repository.courses;

  List<Course> get selectedCourses => courses
      .where((course) => _selectedCodes.contains(course.code))
      .toList(growable: false);

  int get selectedCount => selectedCourses.length;

  int get totalSks =>
      selectedCourses.fold(0, (total, course) => total + course.sks);

  bool isSelected(Course course) => _selectedCodes.contains(course.code);

  void toggle(Course course) {
    if (!_selectedCodes.remove(course.code)) {
      _selectedCodes.add(course.code);
    }
    notifyListeners();
  }
}
