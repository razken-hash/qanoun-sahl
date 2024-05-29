import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/constitution.dart';

class ConstitutionService {
  static Future<List<Constitution>> getConstitutions({
    required String? searchQuery,
    required String? articleNumber,
    required String? chapterNumber,
    required String? chapterName,
    required String? sectionNumber,
    required String? sectionName,
    required int? perPage,
    required int? page,
  }) async {
    List<Constitution> constitutions = [];
    String url =
        "$BASE_URL/constitution/search?${searchQuery != null ? "&search_query=$searchQuery" : ""}${articleNumber != null ? "&article_number=$articleNumber" : ""}${chapterNumber != null ? "&chapter_number=$chapterNumber" : ""}${chapterName != null ? "&chapter_name=$chapterName" : ""}${sectionNumber != null ? "&section_number=$sectionNumber" : ""}${sectionName != null ? "&section_name=$sectionName" : ""}${page != null ? "&page=$page" : ""}${perPage != null ? "&per_page=$perPage" : ""}";

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      log(decodedResponse);
      for (var item in decodedResponse['data']) {
        constitutions.add(Constitution.fromMap(item));
      }
    }
    return constitutions;
  }
}
