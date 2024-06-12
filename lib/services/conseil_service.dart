import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/conseil.dart';

class ConseilService {
  static Future<List<Conseil>> getConseils({
    required String? searchQuery,
    required String? number,
    required String? procedure,
    required String? section,
    required String? chamber,
    required String? startDate,
    required String? endDate,
    required int? perPage,
    required int? page,
  }) async {
    List<Conseil> conseils = [];
    String url =
        "$BASE_URL/conseil-etat/search?${searchQuery != null ? "&search_query=$searchQuery" : ""}${number != null ? "&number=$number" : ""}${procedure != null ? "&procedure=$procedure" : ""}${section != null ? "&section=$section" : ""}${chamber != null ? "&chamber=$chamber" : ""}${startDate != null ? "&start_date=$startDate" : ""}${endDate != null ? "&end_date=$endDate" : ""}${page != null ? "&page=$page" : ""}${perPage != null ? "&per_page=$perPage" : ""}";

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      log(decodedResponse);
      for (var item in decodedResponse['data']) {
        conseils.add(Conseil.fromMap(item));
      }
    }
    return conseils;
  }
}
