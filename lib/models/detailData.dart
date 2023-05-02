import 'package:bokgpt_client/env/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailData {
  final int id;
  final String serviceId;
  final String serviceTitle;
  final String startDate;
  final String endDate;
  final String department;
  final String summary;
  final String supportedBy;
  final String selectionCriteria;
  final String serviceContent;
  final String lastModifiedAt;
  final String detailLink;
  final int view;
  final Map<String, dynamic> location;
  final List<Map<String, dynamic>> homeTypes;
  final List<Map<String, dynamic>> interestThemes;
  final List<Map<String, dynamic>> lifeCycles;
  final List<Map<String, dynamic>> targetCharacteristics;
  final List<Map<String, dynamic>> offerWays;
  final List<Map<String, dynamic>> enrollWays;

  DetailData({
    required this.id,
    required this.serviceId,
    required this.serviceTitle,
    required this.startDate,
    required this.endDate,
    required this.department,
    required this.summary,
    required this.supportedBy,
    required this.selectionCriteria,
    required this.serviceContent,
    required this.lastModifiedAt,
    required this.detailLink,
    required this.view,
    required this.location,
    required this.homeTypes,
    required this.interestThemes,
    required this.lifeCycles,
    required this.targetCharacteristics,
    required this.offerWays,
    required this.enrollWays,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      id: json['id'],
      serviceId: json['serviceId'],
      serviceTitle: json['serviceTitle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      department: json['department'],
      summary: json['summary'],
      supportedBy: json['supportedBy'],
      selectionCriteria: json['selectionCriteria'],
      serviceContent: json['serviceContent'],
      lastModifiedAt: json['lastModifiedAt'],
      detailLink: json['detailLink'],
      view: json['view'],
      location: json['location'],
      homeTypes: List<Map<String, dynamic>>.from(json['homeTypes']),
      interestThemes: List<Map<String, dynamic>>.from(json['interestThemes']),
      lifeCycles: List<Map<String, dynamic>>.from(json['lifeCycles']),
      targetCharacteristics:
          List<Map<String, dynamic>>.from(json['targetCharacteristics']),
      offerWays: List<Map<String, dynamic>>.from(json['offerWays']),
      enrollWays: List<Map<String, dynamic>>.from(json['enrollWays']),
    );
  }
}

Future<DetailData> fetchDetailData(String detailId) async {
  final response =
      await http.get(Uri.parse('${ENV.apiEndpoint}/welfares/${detailId}'));

  if (response.statusCode == 200) {
    print(response.body);
    return DetailData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load detail data');
  }
}
