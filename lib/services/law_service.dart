import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/law.dart';

class LawService {
  static Future<List<Law>> getLaws({
    required String? searchQuery,
    required String? ministry,
    required String? textNumber,
    required String? textType,
    required String? journalStartDate,
    required String? journalEndDate,
    required String? signatureStartDate,
    required String? signatureEndDate,
    required String? field,
    required int? perPage,
    required int? page,
  }) async {
    List<Law> laws = [];
    String url =
        "$BASE_URL/laws/search?${field != null ? "search_field = $field" : ""}${ministry != null ? "&ministry=$ministry" : ""}${searchQuery != null ? "&search_query=$searchQuery" : ""}${textNumber != null ? "&text_number=$textNumber" : ""}${textType != null ? "&text_type=$textType" : ""}${journalStartDate != null ? "&journal_start_date=$journalStartDate" : ""}${journalEndDate != null ? "&journal_end_date=$journalEndDate" : ""}${signatureStartDate != null ? "&signature_start_date=$signatureStartDate" : ""}${signatureEndDate != null ? "&signature_end_date=$signatureEndDate" : ""}${page != null ? "&page=$page" : ""}${perPage != null ? "&per_page=$perPage" : ""}";

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      log(decodedResponse);
      for (var item in decodedResponse['data']) {
        laws.add(Law.fromMap(item));
      }
    }
    return laws;
  }
}
