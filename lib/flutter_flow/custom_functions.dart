import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

dynamic buildThumbnailUrl(String filename) {
  return 'https://api-badminton.arsitek-kode.com/public/thumbnails/$filename';
}

List<dynamic>? getUniqueCategories(dynamic data) {
  final Set<dynamic> categories = {};

  for (final item in data) {
    if (item['kategori'] != null) {
      categories.add(item['kategori']);
    }
  }

  return categories.toList();
}

Color? getRandomCardColor() {
  List<Color> colors = [
    Color(0xFF5AA6CE),
    Color(0xFF18A4B7),
    Color(0xFFFFFFFF),
    Color(0xFFDCC1FF),
  ];

  final random = math.Random();
  return colors[random.nextInt(colors.length)];
}

String? formatingDate(String inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate);

  // Format jadi DD/MM/YYYY
  String day = parsedDate.day.toString().padLeft(2, '0');
  String month = parsedDate.month.toString().padLeft(2, '0');
  String year = parsedDate.year.toString();

  return '$day/$month/$year';
}

String? formatingTime(String time) {
  final parts = time.split(':');
  if (parts.length < 2) return null;

  final hour = parts[0].padLeft(2, '0');
  final minute = parts[1].padLeft(2, '0');

  return '$hour:$minute';
}

bool? getHasUnread(List<dynamic> dataList) {
  for (final item in dataList) {
    if (item is Map<String, dynamic> && item['isRead'] == false) {
      return true;
    }
  }
  return false;
}

List<dynamic>? getUniqueLevel(dynamic data) {
  final Set<dynamic> categories = {};

  for (final item in data) {
    if (item['level'] != null) {
      categories.add(item['level']);
    }
  }

  return categories.toList();
}

int? convertSecToMs(int? seconds) {
  if (seconds == null) return null;
  return seconds * 1000;
}

int? countQuestion(List<dynamic>? data) {
  if (data == null) {
    return 0;
  }
  return data.length - 1;
}

int getScore(
  int nilai,
  int jumlahSoal,
) {
  return ((nilai * 100) / jumlahSoal).floor();
}

double getScorePercentage(int nilai) {
  return nilai / 100;
}

String getUjianFeedback(int score) {
  if (score < 0 || score > 100)
    return "Nilai tidak valid. Skor harus antara 0–100.";

  if (score >= 85) {
    return "Luar biasa! Kerja kerasmu terlihat jelas. Pertahankan semangat dan terus melangkah lebih jauh!";
  } else if (score >= 70) {
    return "Keren! Sudah bagus, tinggal sedikit lagi menuju sempurna. Terus belajar dan jangan lengah!";
  } else if (score >= 55) {
    return "Lumayan! Kamu punya potensi besar, tinggal diasah lagi. Jangan cepat puas, ya!";
  } else if (score >= 40) {
    return "Belum maksimal. Tenang, masih ada waktu untuk bangkit. Belajar lagi, kamu pasti bisa!";
  } else {
    return "Jangan menyerah. Gagal hari ini bukan akhir segalanya. Mulai lagi, kamu lebih kuat dari yang kamu kira.";
  }
}

List<dynamic>? updateAnswerExam(
  List<dynamic>? answerList,
  int? id,
  String? answer,
) {
  if (answerList == null || id == null || answer == null) {
    return answerList;
  }

  final List<Map> updatedList = List<Map>.from(answerList);

  final index = updatedList.indexWhere((item) => item['id'] == id);

  if (index != -1) {
    updatedList[index] = {'id': id, 'answer': answer};
  } else {
    updatedList.add({'id': id, 'answer': answer});
  }

  return updatedList;
}

String formatDateToDDMMYYYY(String dateString) {
  try {
    final parsedDate = DateTime.parse(dateString);
    final day = parsedDate.day.toString().padLeft(2, '0');
    final month = parsedDate.month.toString().padLeft(2, '0');
    final year = parsedDate.year.toString();
    return '$day/$month/$year';
  } catch (e) {
    return 'Invalid Date';
  }
}

dynamic buildPhotoProfileUrl(String filename) {
  return 'https://api-badminton.arsitek-kode.com/public/profile/$filename';
}

String? formatMenitToTimeString(int? menit) {
  if (menit == null || menit < 0) return '0:00';

  final int jam = menit ~/ 60;
  final int sisaMenit = menit % 60;

  final String formatted = '$menit:00';
  return formatted;
}

dynamic buildExamThumbnailUrl(String filename) {
  return 'https://api-badminton.arsitek-kode.com/public/thumbnails/exam/$filename';
}

dynamic buildPracticeThumbnailUrl(String filename) {
  return 'https://api-badminton.arsitek-kode.com/public/thumbnails/practice/$filename';
}

dynamic buildSoalImageUrl(String filename) {
  return 'https://api-badminton.arsitek-kode.com/public/questions/$filename';
}

String? getRandomThumbnailStatistic() {
  final random = math.Random();
  final index = random.nextInt(10) + 1;

  return 'https://api-badminton.arsitek-kode.com/public/statistic/Statistic_$index.png';
}

String? profilImage(String thumbnail) {
  final lower = thumbnail.toLowerCase();
  final isImage = lower.endsWith('.jpg') ||
      lower.endsWith('.jpeg') ||
      lower.endsWith('.png');

  if (isImage) {
    return 'https://api-badminton.arsitek-kode.com/public/profile/$thumbnail';
  } else {
    return thumbnail;
  }
}
