import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/user.dart';
import 'package:qanoun_sahl/services/auth_service.dart';
import 'package:qanoun_sahl/services/local_storage_service.dart';
import 'package:qanoun_sahl/views/auth/auth_provider.dart';
import 'package:qanoun_sahl/views/auth/login_screen.dart';
import 'package:qanoun_sahl/views/auth/register_screen.dart';
import 'package:qanoun_sahl/views/core/home/law/law_provider.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/on_boarding/on_boarding_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';
import 'package:qanoun_sahl/views/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QanounSahlApp());
}

class QanounSahlApp extends StatelessWidget {
  const QanounSahlApp({super.key});

  Future<User?> getUser() async {
    final String? token = await LocalStorageService.getAuthToken();
    final int? userId = await LocalStorageService.getUserId();
    return await AuthService.getUser(userId: userId, token: token);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Qanoun Sahl',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return FutureBuilder<User?>(
              future: getUser(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    User? user = snapshot.data;
                    return user != null
                        ? const QanounSahlScreen()
                        : const OnBoardingScreen();
                  default:
                    return const OnBoardingScreen();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
