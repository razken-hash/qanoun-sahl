import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.imagify("wallpaper"),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              AssetsManager.iconify(
                "legal_eye",
              ),
              height: 40,
            ),
            const SizedBox(height: 65),
            const Text(
              "استكشف عالم القانون مع تطبيق القانون السهل",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              "ابق على دراية بكل التطورات في عالم القانون بكل سهولة وسرعة",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                },
                child: const Text(
                  "ابــــدأ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
