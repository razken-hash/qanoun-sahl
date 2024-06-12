import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/dostor.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class DostorDetailScreen extends StatelessWidget {
  final Dostor constitution;
  const DostorDetailScreen({super.key, required this.constitution});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10, left: 20),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      const Center(
                        child: Text(
                          "الجمهورية الجزائرية الديمقراطية الشعبية",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "القرار رقم ${constitution.number} المؤرخ في ${constitution.date}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "المبدأ:",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Text(constitution.principle),
                      const SizedBox(height: 10),
                      const Text(
                        "رد المحكمة العليا عن الوجه المرتبط بالمبدأ:",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Text(constitution.chamber),
                      const SizedBox(height: 10),
                      const Text(
                        "منطوق القرار:",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Text(constitution.date),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "الرئيس:",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(constitution.pdfLink.isNotEmpty
                              ? constitution.pdfLink
                              : "/"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "المستشار المقرر:",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(constitution.principle.isNotEmpty
                              ? constitution.principle
                              : "/"),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String formatDate(DateTime date) {
  return "${date.year} - ${date.month} - ${date.day}";
}
