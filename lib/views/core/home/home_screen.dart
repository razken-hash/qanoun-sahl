import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/law/law_provider.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/core/home/law/law_screen.dart';
import 'package:qanoun_sahl/views/core/home/court/court_screen.dart';
import 'package:qanoun_sahl/views/core/home/search/search_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, naviagtionProvider, child) {
      return Expanded(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 90,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 90,
                    child: CustomPaint(
                      painter: TopBarPainter(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: const Center(
                            child: Text(
                              "الجريدة الرسمية",
                              style: TextStyle(
                                color: QColors.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: InkWell(
                            onTap: () {
                              pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            },
                            child: SvgPicture.asset(
                              AssetsManager.iconify(
                                "search",
                              ),
                              color: QColors.whiteColor,
                              height: 30,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: const Center(
                            child: Text(
                              "المحكمة العليا",
                              style: TextStyle(
                                color: QColors.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  LawScreen(),
                  GeneralSearchScreen(),
                  CourtScreen(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
