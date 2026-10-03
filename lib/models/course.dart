import 'package:flutter/material.dart';

enum CourseType {
  wajib('Wajib'),
  pilihan('Pilihan');

  const CourseType(this.label);

  final String label;
}

@immutable
class Course {
  const Course({
    required this.code,
    required this.name,
    required this.sks,
    required this.type,
    required this.lecturer,
    required this.schedule,
    required this.room,
    required this.description,
    required this.icon,
  });

  /// Kode unik, dipakai sebagai id pilihan.
  final String code;
  final String name;
  final int sks;
  final CourseType type;
  final String lecturer;
  final String schedule;
  final String room;
  final String description;
  final IconData icon;
}
