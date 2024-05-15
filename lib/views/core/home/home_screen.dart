import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/drawer/q_drawer.dart';
import 'package:qanoun_sahl/views/core/journal/journal_screen.dart';
import 'package:qanoun_sahl/views/core/mahkama/mahkama_screen.dart';
import 'package:qanoun_sahl/views/core/search/search_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';
import 'package:qanoun_sahl/views/widgets/circle_button.dart';

enum Functionality { Journal, GeneralSearch, Mahkama }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 20;

  Functionality selectedFunctionality = Functionality.GeneralSearch;

  PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 20, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 8, 10),
                    child: Row(
                      children: [
                        CircleButton(
                          icon: "menu",
                          onTap: () {
                            setState(() {
                              width = 300;
                            });
                          },
                        ),
                        const Spacer(),
                        const CircleButton(icon: "gpt"),
                        const SizedBox(width: 10),
                        const CircleButton(icon: "notification"),
                      ],
                    ),
                  ),
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
                                      duration:
                                          const Duration(milliseconds: 400),
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
                                        duration:
                                            const Duration(milliseconds: 400),
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
                                      duration:
                                          const Duration(milliseconds: 400),
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
                        JournalScreen(),
                        GeneralSearchScreen(),
                        MahkamaScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (width > 20)
              Expanded(
                child: Container(
                  color: QColors.blackColor.withOpacity(.2),
                ),
              ),
            QDrawer(
              onClick: () {
                setState(() {
                  width = 20;
                });
              },
              width: width,
            )
          ],
        ),
      ),
    );
  }
}

class TopBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height, width = size.width;
    final double centerX = size.width * .5, centerY = size.height * .5;
    final paint = Paint();
    paint.color = QColors.primaryColor;
    final path = Path();
    path.moveTo(width * .5, 15);
    path.quadraticBezierTo(width * .6, height * .15, width * .62, height * .6);
    path.quadraticBezierTo(width * .64, height * .95, width * .8, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    path.moveTo(width * .5, 15);
    path.quadraticBezierTo(width * .4, height * .15, width * .38, height * .6);
    path.quadraticBezierTo(width * .36, height * .95, width * .2, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);
    path.moveTo(width * .5, height * .5);
    path.addOval(
      Rect.fromCenter(
          center: Offset(centerX, centerY + 10),
          width: height * .65,
          height: height * .65),
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
