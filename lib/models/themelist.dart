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

Future<List<InterestTheme>> fetchDataFromEndpoint(int themeId) async {
  final response = await http.get(Uri.parse(
      'http://54.180.116.84:8080/welfares/interest-themes/${themeId}?page=0&size=10&sort=string'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    final List<InterestTheme> data = jsonData
        .map((e) => InterestTheme.fromJson(e as Map<String, dynamic>))
        .toList();
    return data;
  } else {
    throw Exception('Failed to load data from endpoint.');
  }
}
