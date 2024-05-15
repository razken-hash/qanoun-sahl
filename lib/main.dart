import 'package:flutter/material.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/core/notifications/notifications_screen.dart';
import 'package:qanoun_sahl/views/on_boarding/on_boarding_screen.dart';
import 'package:qanoun_sahl/views/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QanounSahlApp());
}

class QanounSahlApp extends StatelessWidget {
  const QanounSahlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qanoun Sahl',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const QanounSahlScreen(),
    );
  }
}
