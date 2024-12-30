import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/app/root_screen.dart';
import 'package:tanyadokter_dokter/core/theme/app_theme.dart';
import 'package:tanyadokter_dokter/feature/consultation/ui/chat_session_screen.dart';
import 'package:tanyadokter_dokter/feature/consultation/ui/connecting_screen.dart';
import 'package:tanyadokter_dokter/feature/consultation/ui/consultation_screen.dart';
import 'package:tanyadokter_dokter/feature/consultation/ui/prescription_screen.dart';
import 'package:tanyadokter_dokter/feature/dashboard/ui/home_screen.dart';
import 'package:tanyadokter_dokter/feature/history/ui/history_detail.dart';
import 'package:tanyadokter_dokter/feature/history/ui/history_screen.dart';
import 'package:tanyadokter_dokter/feature/login/ui/login_screen.dart';
import 'package:tanyadokter_dokter/feature/profile/ui/info_screen.dart';
import 'package:tanyadokter_dokter/feature/profile/ui/profile_setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TanyaDokter - Dokter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      home: const RootScreen(),
      initialRoute: '/login',
      routes: {
        '/root': (context) => const RootScreen(),
        '/login': (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ConsultationScreen.routeName: (context) => const ConsultationScreen(),
        ConnectingScreen.routeName: (context) => const ConnectingScreen(),
        ChatSessionScreen.routeName: (context) => const ChatSessionScreen(),
        PrescriptionScreen.routeName: (context) => const PrescriptionScreen(),
        '/history': (context) => const HistoryScreen(),
        '/history-detail': (context) => const HistoryDetail(),
        '/profile-settings': (context) => const ProfileSettingScreen(),
        '/info': (context) => const InfoScreen(),
      },
    );
  }
}
