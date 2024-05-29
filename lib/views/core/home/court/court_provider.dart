import "dart:developer";

import "package:flutter/material.dart";
import 'package:qanoun_sahl/models/court.dart';
import "package:qanoun_sahl/services/court_service.dart";

class CourtProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;

  String? searchQuery,
      searchField,
      decisionSubject,
      startDate,
      endDate,
      decisionNumber;

  void updateParams() {}

  CourtProvider({
    String? searchQuery,
    String? searchField,
    String? decisionSubject,
    String? startDate,
    String? endDate,
    String? decisionNumber,
  }) {
    allCourts = [];
    getCourts(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getCourts(page: page++);
      }
    });
  }

  List<Court> allCourts = [];

  bool isLoading = true;

  void getCourts({int page = 1}) async {
    isLoading = true;
    List<Court> courts = await CourtService.getCourts(
        searchQuery: searchQuery,
        searchField: searchField,
        decisionSubject: decisionSubject,
        startDate: startDate,
        endDate: endDate,
        decisionNumber: decisionNumber,
        perPage: perPage,
        page: page);
    log(courts.toString());
    allCourts.addAll(courts);
    isLoading = false;
    notifyListeners();
  }
}
