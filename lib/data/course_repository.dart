import 'package:flutter/material.dart';

import '../models/course.dart';

/// Satu-satunya sumber data mata kuliah (fiktif, hanya untuk tugas).
class CourseRepository {
  const CourseRepository();

  List<Course> get courses => _courses;
}

const _courses = <Course>[
  Course(
    code: 'IF5101',
    name: 'Pemrograman Mobile',
    sks: 3,
    type: CourseType.wajib,
    lecturer: 'Dr. Rina Kusuma, M.Kom.',
    schedule: 'Senin, 08.00–10.30',
    room: 'Lab 2.3',
    description:
        'Membangun aplikasi Android dan iOS dengan Flutter: widget, state, dan navigasi.',
    icon: Icons.phone_android,
  ),
  Course(
    code: 'IF5102',
    name: 'Basis Data Lanjut',
    sks: 3,
    type: CourseType.wajib,
    lecturer: 'Budi Santoso, M.T.',
    schedule: 'Senin, 13.00–15.30',
    room: 'R. 3.12',
    description:
        'Optimasi query, indeks, transaksi, dan perancangan basis data skala menengah.',
    icon: Icons.storage_outlined,
  ),
  Course(
    code: 'IF5103',
    name: 'Rekayasa Perangkat Lunak',
    sks: 3,
    type: CourseType.wajib,
    lecturer: 'Dr. Ayu Lestari, M.Kom.',
    schedule: 'Selasa, 08.00–10.30',
    room: 'R. 3.07',
    description:
        'Proses pengembangan perangkat lunak: kebutuhan, desain, pengujian, dan pemeliharaan.',
    icon: Icons.account_tree_outlined,
  ),
  Course(
    code: 'IF5104',
    name: 'Jaringan Komputer',
    sks: 3,
    type: CourseType.wajib,
    lecturer: 'Hendra Wijaya, M.Sc.',
    schedule: 'Rabu, 10.00–12.30',
    room: 'Lab 1.1',
    description:
        'Model TCP/IP, pengalamatan, routing, dan dasar keamanan jaringan.',
    icon: Icons.router_outlined,
  ),
  Course(
    code: 'IF5105',
    name: 'Interaksi Manusia dan Komputer',
    sks: 2,
    type: CourseType.pilihan,
    lecturer: 'Sari Dewanti, M.Kom.',
    schedule: 'Kamis, 09.00–10.40',
    room: 'R. 2.05',
    description:
        'Prinsip desain antarmuka yang mudah dipakai, termasuk evaluasi dengan pengguna.',
    icon: Icons.touch_app_outlined,
  ),
  Course(
    code: 'IF5106',
    name: 'Analisis dan Perancangan Sistem',
    sks: 3,
    type: CourseType.pilihan,
    lecturer: 'Agus Prasetyo, M.T.',
    schedule: 'Jumat, 08.00–10.30',
    room: 'R. 3.09',
    description:
        'Memodelkan kebutuhan sistem informasi dengan UML dan merancang solusinya.',
    icon: Icons.design_services_outlined,
  ),
];
