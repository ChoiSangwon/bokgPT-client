import 'dart:convert';
import 'package:http/http.dart' as http;

class InterestTheme {
  final int id;
  final String title;
  final DateTime lastModifiedAt;
  final int view;
  final List<Map<String, dynamic>> lifeCycles;

  InterestTheme({
    required this.id,
    required this.title,
    required this.lastModifiedAt,
    required this.view,
    required this.lifeCycles,
  });

  factory InterestTheme.fromJson(Map<String, dynamic> json) {
    return InterestTheme(
      id: json['id'],
      title: json['title'],
      lastModifiedAt: DateTime.parse(json['lastModifiedAt']),
      view: json['view'],
      lifeCycles: List<Map<String, dynamic>>.from(json['lifeCycles']),
    );
  }
}
