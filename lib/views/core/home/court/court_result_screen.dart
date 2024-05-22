import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/court/court_provider.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class CourtResultScreen extends StatefulWidget {
  const CourtResultScreen({super.key});

  @override
  State<CourtResultScreen> createState() => _CourtResultScreenState();
}

class _CourtResultScreenState extends State<CourtResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Consumer<CourtProvider>(
          builder: (context, mahkamaSearchProvider, child) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, top: 10, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            naviagtionProvider.pop();
                          },
                          child: SvgPicture.asset(
                            AssetsManager.iconify(
                              "semi-arrow-right-square",
                            ),
                            color: QColors.primaryColor,
                            height: 30,
                            width: 40,
                          ),
                        ),
                        const Text(
                          "نتائج البحث",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SvgPicture.asset(
                          AssetsManager.iconify(
                            "search",
                          ),
                          color: QColors.primaryColor,
                          height: 30,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                    color: QColors.primaryColor,
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: QColors.primaryColor.withOpacity(.3),
                        ),
                        child: Column(
                          children: [
                            Text(
                              mahkamaSearchProvider.allCourts[index].principle,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              mahkamaSearchProvider
                                  .allCourts[index].groundAppeal,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
