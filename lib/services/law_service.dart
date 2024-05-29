import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/law.dart';

class LawService {
  static Future<List<Law>> getCourts({
    required String? searchQuery,
    required String? searchField,
    required int? perPage,
    required int? page,
  }) async {
    List<Law> journals = [];
    String url =
        "$BASE_URL/journals/search?${searchField != null ? "search_field = $searchField" : ""}${searchQuery != null ? "&search_query=$searchQuery" : ""}${page != null ? "&page=$page" : ""}${perPage != null ? "&per_page=$perPage" : ""}";

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      log(decodedResponse);
      for (var item in decodedResponse['data']) {
        journals.add(Law.fromMap(item));
      }
    }
    return journals;
  }
}
