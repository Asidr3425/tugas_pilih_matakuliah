# KURASI: Pilih Mata Kuliah

A small Flutter app for choosing semester courses. Built as a student assignment to practice `Card`, `ListView`, `ListTile`, and `ListView.builder`.

> Courses, lecturers, and schedules are fictional. This is not an official university KRS system.

## Flow

**Katalog → Detail → Ambil → Mata Kuliah Saya → Simpan**

1. **Catalog:** a Semester 5 list of six Informatics courses. Each card shows the icon, code, name, SKS, lecturer, schedule, type, and one action: "Ambil".
2. **Detail:** tap a card to open a bottom sheet with the room and a short description.
3. **Select:** "Ambil" becomes "Diambil" with a check icon and a tinted card. Tap again to remove the course.
4. **Review:** "Mata Kuliah Saya" lists the selected courses with a total such as "2 Mata Kuliah · 6 SKS". With nothing selected, it shows an empty message and "Tinjau & Simpan" is disabled.
5. **Save:** "Tinjau & Simpan" opens a confirmation dialog ("Batal" / "Simpan"), then a snackbar says "Pilihan tersimpan".

Saving only confirms the choice. Nothing is persisted, so the selection resets when the app restarts.

## Run

Requires Flutter 3.27 or newer (Dart 3.6+).

```bash
flutter pub get
flutter run
```

Other checks:

```bash
flutter analyze
flutter test
```

## Project structure

```
lib/
  main.dart                        App entry, creates the ViewModel
  models/course.dart               Course and CourseType
  data/course_repository.dart      Single source of course data
  viewmodels/selection_viewmodel.dart
                                   Selection state (ChangeNotifier)
  screens/
    catalog_screen.dart            Header, course list, detail sheet
    my_courses_screen.dart         Review list, save dialog, snackbar
  widgets/
    course_card.dart               Card + ListTile for one course
    course_detail_sheet.dart       Bottom sheet content
    course_parts.dart              Shared icon box, pill, info row
  theme/app_theme.dart             Colors, text styles, component themes
test/widget_test.dart              Full-flow and empty-state tests
```

## How it works

- **One source of truth:** `CourseRepository` holds the course list and `SelectionViewModel` holds the selected course codes. The selected list, count, and total SKS are calculated from that state, never stored separately.
- **Unidirectional flow:** widgets call `toggle()` on the ViewModel, it notifies listeners, and `ListenableBuilder` rebuilds the screens. Widgets only present state.
- **No extra packages:** only the Flutter SDK is used. There is no Provider, routing package, database, or API.

## Scope

Kept intentionally small. Not included: filter or search, database, API, authentication, dashboards, analytics, and a success page.
