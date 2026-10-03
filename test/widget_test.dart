import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_pilih_matakuliah/data/course_repository.dart';
import 'package:tugas_pilih_matakuliah/main.dart';
import 'package:tugas_pilih_matakuliah/viewmodels/selection_viewmodel.dart';
import 'package:tugas_pilih_matakuliah/widgets/course_detail_sheet.dart';

Future<void> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    KurasiApp(viewModel: SelectionViewModel(const CourseRepository())),
  );
}

void main() {
  testWidgets('katalog > detail > pilih > tinjau > simpan', (tester) async {
    await pumpApp(tester);

    // Katalog
    expect(find.text('Pemrograman Mobile'), findsOneWidget);
    expect(find.text('0 Mata Kuliah · 0 SKS'), findsOneWidget);

    // Pilih langsung dari kartu
    await tester.tap(find.text('Ambil').first);
    await tester.pump();
    expect(find.text('Diambil'), findsOneWidget);
    expect(find.text('1 Mata Kuliah · 3 SKS'), findsOneWidget);

    // Detail (bottom sheet), lalu pilih dari sana
    await tester.tap(find.text('Basis Data Lanjut'));
    await tester.pumpAndSettle();
    expect(find.text('R. 3.12'), findsOneWidget);
    await tester.tap(
      find.descendant(
        of: find.byType(CourseDetailSheet),
        matching: find.text('Ambil'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('2 Mata Kuliah · 6 SKS'), findsOneWidget);

    // Mata Kuliah Saya
    await tester.tap(find.text('Mata Kuliah Saya'));
    await tester.pumpAndSettle();
    expect(find.text('2 Mata Kuliah · 6 SKS'), findsOneWidget);
    expect(find.text('Pemrograman Mobile'), findsOneWidget);
    expect(find.text('Basis Data Lanjut'), findsOneWidget);

    // Simpan
    await tester.tap(find.text('Tinjau & Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Simpan pilihan mata kuliah?'), findsOneWidget);
    await tester.tap(find.text('Simpan'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Pilihan tersimpan'), findsOneWidget);
  });

  testWidgets('Mata Kuliah Saya kosong: pesan tampil, simpan nonaktif', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('Mata Kuliah Saya'));
    await tester.pumpAndSettle();

    expect(find.text('Belum ada mata kuliah dipilih'), findsOneWidget);
    final save = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Tinjau & Simpan'),
    );
    expect(save.onPressed, isNull);
  });
}
