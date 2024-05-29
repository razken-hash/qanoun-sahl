import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/court/court_result_screen.dart';
import 'package:qanoun_sahl/views/core/home/law/law_provider.dart';
import 'package:qanoun_sahl/views/core/home/law/law_result_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class LawScreen extends StatelessWidget {
  LawScreen({super.key});

  final TextEditingController searchController = TextEditingController(),
      publishBeginDateController = TextEditingController(),
      publishEndDateController = TextEditingController(),
      signBeginDateController = TextEditingController(),
      signEndDateController = TextEditingController(),
      numberController = TextEditingController(),
      typeController = TextEditingController(),
      fieldController = TextEditingController(),
      ministryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, naviagtionProvider, child) {
      return Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "الجريدة الرسمية",
                  style: TextStyle(
                    fontSize: 18,
                    color: QColors.blackColor,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 70,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: "اكتب شيئا ما",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetsManager.iconify("search"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "فرز النتائج",
                        style: TextStyle(
                          fontSize: 18,
                          color: QColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "حسب تاريخ النشر",
                      style: TextStyle(
                        fontSize: 18,
                        color: QColors.blackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "من",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: publishBeginDateController,
                          decoration: InputDecoration(
                            labelText: "2000/01/01",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("calendar"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "إلى",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: publishEndDateController,
                          decoration: InputDecoration(
                            labelText:
                                "${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, "0")}/${DateTime.now().day.toString().padLeft(2, "0")}",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("calendar"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "حسب تاريخ الإمضاء",
                      style: TextStyle(
                        fontSize: 18,
                        color: QColors.blackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "من",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: signBeginDateController,
                          decoration: InputDecoration(
                            labelText: "2000/01/01",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("calendar"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "إلى",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: signEndDateController,
                          decoration: InputDecoration(
                            labelText:
                                "${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, "0")}/${DateTime.now().day.toString().padLeft(2, "0")}",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("calendar"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "حسب الجريدة",
                      style: TextStyle(
                        fontSize: 18,
                        color: QColors.blackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "رقم:",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: numberController,
                          decoration: InputDecoration(
                            labelText: "12345",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "نوع:",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: typeController,
                          decoration: InputDecoration(
                            labelText: "شهرية",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "حسب المؤسسة",
                      style: TextStyle(
                        fontSize: 18,
                        color: QColors.blackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "القطاع:",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: fieldController,
                          decoration: InputDecoration(
                            labelText: "العدل",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "الوزارة:",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 70,
                        child: TextFormField(
                          controller: ministryController,
                          decoration: InputDecoration(
                            labelText: "العدل",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  naviagtionProvider.saveAndGoto(
                    ChangeNotifierProvider(
                      create: (context) => LawProvider(
                        searchQuery: searchController.text,
                        ministry: ministryController.text,
                        textNumber: numberController.text,
                        textType: typeController.text,
                        journalStartDate: publishBeginDateController.text,
                        journalEndDate: publishEndDateController.text,
                        signatureStartDate: signBeginDateController.text,
                        signatureEndDate: signEndDateController.text,
                        field: fieldController.text,
                      ),
                      child: const LawResultScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("عرض النتائج"),
                    SvgPicture.asset(
                      AssetsManager.iconify("semi-arrow-left"),
                      color: QColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
