import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_result_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class MahkamaScreen extends StatefulWidget {
  const MahkamaScreen({super.key});

  @override
  State<MahkamaScreen> createState() => _MahkamaScreenState();
}

class _MahkamaScreenState extends State<MahkamaScreen> {
  TextEditingController searchController = TextEditingController(text: "جناية"),
      beginDateController = TextEditingController(),
      endDateController = TextEditingController(),
      decisionNumberController = TextEditingController(),
      decisionSubjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
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
                              "رقم القرار:",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width - 120,
                        //   height: 70,
                        //   child: DropdownButtonFormField2<String>(
                        //     isExpanded: true,
                        //     decoration: InputDecoration(
                        //       // Add Horizontal padding using menuItemStyleData.padding so it matches
                        //       // the menu padding when button's width is not specified.
                        //       contentPadding:
                        //           const EdgeInsets.symmetric(vertical: 16),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       // Add more decoration..
                        //     ),
                        //     hint: const Text(
                        //       'Select Your Gender',
                        //       style: TextStyle(fontSize: 14),
                        //     ),
                        //     items: ["sdf", "sdfadf"]
                        //         .map((item) => DropdownMenuItem<String>(
                        //               value: item,
                        //               child: Text(
                        //                 item,
                        //                 style: const TextStyle(
                        //                   fontSize: 14,
                        //                 ),
                        //               ),
                        //             ))
                        //         .toList(),
                        //     validator: (value) {
                        //       if (value == null) {
                        //         return 'Please select gender.';
                        //       }
                        //       return null;
                        //     },
                        //     onChanged: (value) {
                        //       //Do something when selected item is changed.
                        //     },
                        //     onSaved: (value) {
                        //       // selectedValue = value.toString();
                        //     },
                        //     buttonStyleData: const ButtonStyleData(
                        //       padding: EdgeInsets.only(right: 8),
                        //     ),
                        //     iconStyleData: IconStyleData(
                        //       icon: SvgPicture.asset(
                        //         AssetsManager.iconify("semi-arrow-down"),
                        //         width: 50,
                        //       ),
                        //     ),
                        //     dropdownStyleData: DropdownStyleData(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //     ),
                        //     menuItemStyleData: const MenuItemStyleData(
                        //       padding: EdgeInsets.symmetric(horizontal: 16),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          height: 70,
                          child: TextFormField(
                            controller: decisionNumberController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "مثلا 1234",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                              "موضوع القرار:",
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
                            controller: decisionSubjectController,
                            decoration: const InputDecoration(
                              labelText: "موضوع كذا كذا",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    log(searchController.text.toString());
                    naviagtionProvider.saveAndGoto(
                      ChangeNotifierProvider(
                        create: (context) => CourtProvider(
                          searchQuery: searchController.text,
                          startDate: beginDateController.text,
                          endDate: endDateController.text,
                          decisionSubject: decisionSubjectController.text,
                          decisionNumber: decisionNumberController.text,
                        ),
                        child: const MahkamaResultScreen(),
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
      },
    );
  }
}
