import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QanounSahlApp());
}

class QanounSahlApp extends StatelessWidget {
  const QanounSahlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Qanoun Sahl',
      debugShowCheckedModeBanner: false,
    );
  }
}
