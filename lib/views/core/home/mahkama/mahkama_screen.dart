import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class MahkamaScreen extends StatelessWidget {
  MahkamaScreen({super.key});

  TextEditingController searchController = TextEditingController(),
      beginDateController = TextEditingController(),
      endDateController = TextEditingController(),
      roomController = TextEditingController(),
      decisionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "المحكمة العليا",
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
                        controller: beginDateController,
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
                        controller: endDateController,
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
                    "إضافات",
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
                          "الغرفة:",
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
                        controller: roomController,
                        decoration: InputDecoration(
                          labelText: "الغرفة كذا كذا",
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
                          "القرار:",
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
                        controller: decisionController,
                        decoration: InputDecoration(
                          labelText: "قرار كذا كذا",
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
              onPressed: () {},
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
  }
}
