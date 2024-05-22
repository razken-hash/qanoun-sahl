import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/court.dart';

class CourtService {
  static Future<List<Court>> getCourts({
    required String? searchQuery,
    required String? searchField,
    required String? decisionSubject,
    required String? startDate,
    required String? endDate,
    required String? decisionNumber,
    required int? perPage,
    required int? page,
  }) async {
    List<Court> courts = [];
    String url =
        "$BASE_URL/supreme-court/search?${searchField != null ? "search_field = $searchField" : ""}${searchQuery != null ? "&search_query=$searchQuery" : ""}${decisionNumber != null ? "&decision_number=$decisionNumber" : ""}${decisionSubject != null ? "&decision_subject=$decisionSubject" : ""}${startDate != null ? "&start_date=$startDate" : ""}${endDate != null ? "&end_date=$endDate" : ""}${page != null ? "&page=$page" : ""}${perPage != null ? "&per_page=$perPage" : ""}";

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      log(decodedResponse);
      for (var item in decodedResponse['data']) {
        courts.add(Court.fromMap(item));
      }
    }
    return courts;
  }
}
