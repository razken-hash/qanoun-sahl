import "dart:developer";

import "package:flutter/material.dart";
import 'package:qanoun_sahl/models/mahkama.dart';
import "package:qanoun_sahl/services/mahkama_service.dart";

class CourtProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;

  String? searchQuery, decisionSubject, startDate, endDate, decisionNumber;

  CourtProvider({
    this.searchQuery,
    this.decisionSubject,
    this.startDate,
    this.endDate,
    this.decisionNumber,
  }) {
    allMahkama = [];
    getCourts(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getCourts(page: page++);
      }
    });
  }

  List<Mahkama> allMahkama = [];

  bool isLoading = true;

  void getCourts({int page = 1}) async {
    isLoading = true;
    log(searchQuery.toString());
    List<Mahkama> courts = await MahkamaService.getCourts(
      searchQuery: searchQuery ?? "",
      decisionSubject: decisionSubject ?? "",
      startDate: startDate ?? "",
      endDate: endDate ?? "",
      decisionNumber: decisionNumber ?? "",
      perPage: perPage,
      page: page,
    );
    allMahkama.addAll(courts);
    isLoading = false;
    notifyListeners();
  }
}
