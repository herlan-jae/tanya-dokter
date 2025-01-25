import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_dokter/app/root_screen.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/constant/app_theme.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/chat_session_screen.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/connecting_screen.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/consultation_screen.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/prescription_screen.dart';
import 'package:tanyadokter_dokter/features/edit_profile/ui/edit_profile.dart';
import 'package:tanyadokter_dokter/features/home/ui/home_screen.dart';
import 'package:tanyadokter_dokter/features/history/ui/history_detail.dart';
import 'package:tanyadokter_dokter/features/history/ui/history_screen.dart';
import 'package:tanyadokter_dokter/features/login/bloc/login_bloc.dart';
import 'package:tanyadokter_dokter/features/login/data/login_api.dart';
import 'package:tanyadokter_dokter/features/login/data/login_repository.dart';
import 'package:tanyadokter_dokter/features/login/ui/login_screen.dart';
import 'package:tanyadokter_dokter/features/profile/ui/info_screen.dart';
import 'package:tanyadokter_dokter/features/profile/ui/profile_screen.dart';
import 'package:tanyadokter_dokter/features/profile_settings/ui/profile_setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final session = await SessionHelper.getUserSession();
  runApp(MyApp(
    isLoggedIn: session["token"] != null,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final loginApi = LoginApiService(dio);
    final loginRepository = LoginRepository(loginApi);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => loginApi),
        RepositoryProvider(create: (_) => loginRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc(loginRepository)),
        ],
        child: MaterialApp(
          title: 'TanyaDokter - Dokter',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(context),
          home: const RootScreen(),
          initialRoute: isLoggedIn ? '/root' : '/login',
          //
          routes: {
            '/root': (context) => const RootScreen(),
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => ProfileScreen(),
            '/consultation': (context) => const ConsultationScreen(),
            ConnectingScreen.routeName: (context) => const ConnectingScreen(),
            ChatSessionScreen.routeName: (context) => const ChatSessionScreen(),
            PrescriptionScreen.routeName: (context) =>
                const PrescriptionScreen(),
            '/history': (context) => const HistoryScreen(),
            '/history-detail': (context) => const HistoryDetail(),
            '/profile-settings': (context) => ProfileSettingScreen(),
            '/edit': (context) => const EditProfileScreen(),
            '/info': (context) => const InfoScreen(),
          },
        ),
      ),
    );
  }
}
