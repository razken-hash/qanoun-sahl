import "package:flutter/material.dart";
import 'package:qanoun_sahl/models/court.dart';
import "package:qanoun_sahl/services/court_service.dart";

class CourtProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  int page = 1;
  final int perPage = 1;

  final String? searchQuery,
      searchField,
      decisionSubject,
      startDate,
      endDate,
      decisionNumber;

  CourtProvider({
    this.searchQuery,
    this.searchField,
    this.decisionSubject,
    this.startDate,
    this.endDate,
    this.decisionNumber,
  }) {
    getCourts(page: page++);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
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
    allCourts.addAll(courts);
    isLoading = false;
    notifyListeners();
  }
}
