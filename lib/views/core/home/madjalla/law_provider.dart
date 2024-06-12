import "dart:developer";

import "package:flutter/material.dart";
import "package:qanoun_sahl/models/law.dart";
import "package:qanoun_sahl/services/law_service.dart";

class LawProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;

  String? searchQuery,
      ministry,
      textNumber,
      textType,
      journalStartDate,
      journalEndDate,
      signatureStartDate,
      signatureEndDate,
      field;

  LawProvider({
    String? searchQuery,
    String? ministry,
    String? textNumber,
    String? textType,
    String? journalStartDate,
    String? journalEndDate,
    String? signatureStartDate,
    String? signatureEndDate,
    String? field,
  }) {
    allLaws = [];
    getLaws(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getLaws(page: page++);
      }
    });
  }

  List<Law> allLaws = [];

  bool isLoading = true;

  void getLaws({int page = 1}) async {
    isLoading = true;
    List<Law> laws = await LawService.getLaws(
      searchQuery: searchQuery,
      ministry: ministry,
      textNumber: textNumber,
      textType: textType,
      journalStartDate: journalStartDate,
      journalEndDate: journalEndDate,
      signatureStartDate: signatureStartDate,
      signatureEndDate: signatureEndDate,
      field: field,
      perPage: perPage,
      page: page,
    );
    log(laws.toString());
    allLaws.addAll(laws);
    isLoading = false;
    notifyListeners();
  }
}
