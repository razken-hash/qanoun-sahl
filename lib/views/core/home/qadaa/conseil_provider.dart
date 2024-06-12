import "dart:developer";

import "package:flutter/material.dart";
import "package:qanoun_sahl/models/conseil.dart";
import "package:qanoun_sahl/services/conseil_service.dart";

class ConseilProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;

  String? searchQuery, number, procedure, section, chamber, startDate, endDate;

  ConseilProvider({
    String? searchQuery,
    String? number,
    String? procedure,
    String? section,
    String? chamber,
    String? startDate,
    String? endDate,
  }) {
    allConseils = [];
    getConseils(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getConseils(page: page++);
      }
    });
  }

  List<Conseil> allConseils = [];

  bool isLoading = true;

  void getConseils({int page = 1}) async {
    isLoading = true;
    List<Conseil> conseils = await ConseilService.getConseils(
      searchQuery: searchQuery,
      number: number,
      procedure: procedure,
      section: section,
      chamber: chamber,
      startDate: startDate,
      endDate: endDate,
      page: page,
      perPage: perPage,
    );
    log(conseils.toString());
    allConseils.addAll(conseils);
    isLoading = false;
    notifyListeners();
  }
}
