import 'dart:io';

List<int> gradingStudents(List<int> grades) {
  return grades.map((grade) {
    if (grade < 38) return grade;

    int nextMultipleOf5 = ((grade / 5).ceil() * 5);

    if (nextMultipleOf5 - grade < 3) {
      return nextMultipleOf5;
    }

    return grade;
  }).toList();
}

void main() {
  print('Sprint Asia University Grade Rounding System');
  print('---------------------------------------------');

  print('Berapa banyak siswa?');
  String? inputCount = stdin.readLineSync();

  int? studentCount = int.tryParse(inputCount ?? '');
  if (studentCount == null || studentCount < 1 || studentCount > 60) {
    print('Jumlah siswa tidak valid. Harap masukkan angka lebih dari 1.');
    return;
  }

  List<int> originalGrades = [];
  for (int i = 1; i <= studentCount; i++) {
    print('Masukkan nilai siswa ke-$i (0-100):');
    String? gradeInput = stdin.readLineSync();

    int? grade = int.tryParse(gradeInput ?? '');
    if (grade == null || grade < 0 || grade > 100) {
      print('Nilai tidak valid. Harap masukkan angka antara 0-100.');
      i--;
      continue;
    }

    originalGrades.add(grade);
  }

  List<int> roundedGrades = gradingStudents(originalGrades);

  print('\nHasil Penilaian:');
  print('----------------');
  for (int i = 0; i < originalGrades.length; i++) {
    print('Siswa ${i + 1}: ${originalGrades[i]} → ${roundedGrades[i]}');
  }
}
