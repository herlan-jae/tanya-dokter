import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_dokter/app/root_screen.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/constant/app_theme.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/data/reset_password_api.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/data/reset_password_repository.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/ui/forgot_password_screen.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/ui/pin_verification_screen.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:tanyadokter_dokter/features/chat/bloc/chat_bloc.dart';
import 'package:tanyadokter_dokter/features/chat/data/chat_repository.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/consultation_screen.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/prescription_screen.dart';
import 'package:tanyadokter_dokter/features/profile/edit_profile/ui/edit_profile.dart';
import 'package:tanyadokter_dokter/features/home/ui/home_screen.dart';
import 'package:tanyadokter_dokter/features/history/ui/history_detail.dart';
import 'package:tanyadokter_dokter/features/history/ui/history_screen.dart';
import 'package:tanyadokter_dokter/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_dokter/features/auth/login/data/login_api.dart';
import 'package:tanyadokter_dokter/features/auth/login/data/login_repository.dart';
import 'package:tanyadokter_dokter/features/auth/login/ui/login_screen.dart';
import 'package:tanyadokter_dokter/features/profile/profile_screens/ui/about_screen.dart';
import 'package:tanyadokter_dokter/features/profile/profile_screens/ui/profile_screen.dart';
import 'package:tanyadokter_dokter/features/profile/profile_settings/ui/profile_setting_screen.dart';

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
    final resetPasswordApi = ResetPasswordApiService(dio);
    final resetPasswordRepository = ResetPasswordRepository(resetPasswordApi);
    final chatReository = ChatRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => loginApi),
        RepositoryProvider(create: (_) => loginRepository),
        RepositoryProvider(create: (_) => resetPasswordRepository),
        RepositoryProvider(create: (_) => chatReository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(loginRepository),
          ),
          BlocProvider(
            create: (context) => ResetPasswordBloc(resetPasswordRepository),
          ),
          BlocProvider(
            create: (_) => ChatBloc(repository: chatReository),
          ),
        ],
        child: MaterialApp(
          title: 'TanyaDokter - Dokter',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(context),
          home: const RootScreen(),
          initialRoute: isLoggedIn ? '/root' : '/login',
          //isLoggedIn ? '/root' : '/login'
          routes: {
            '/root': (context) => const RootScreen(),
            '/login': (context) => const LoginScreen(),
            '/forgot-password': (context) => const ForgotPasswordScreen(),
            '/home': (context) => const HomeScreen(),
            '/reset-pin': (context) => const ResetVerificationScreen(),
            '/reset-password': (context) => const ResetPasswordScreen(),
            '/profile': (context) => ProfileScreen(),
            '/consultation': (context) => const ConsultationScreen(),
            PrescriptionScreen.routeName: (context) =>
                const PrescriptionScreen(),
            '/history': (context) => const HistoryScreen(),
            '/history-detail': (context) => const HistoryDetail(),
            '/profile-settings': (context) => ProfileSettingScreen(),
            '/edit': (context) => const EditProfileScreen(),
            '/about': (context) => const AboutScreen(),
          },
        ),
      ),
    );
  }
}
