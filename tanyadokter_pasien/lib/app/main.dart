import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/firebase_options.dart';
import 'package:tanyadokter_pasien/app/root_screen.dart';
import 'package:tanyadokter_pasien/core/theme/app_theme.dart';
import 'package:tanyadokter_pasien/features/profile/ui/about_application.dart';
import 'package:tanyadokter_pasien/features/profile/ui/delete_profile.dart';
import 'package:tanyadokter_pasien/features/profile/ui/edit_profile.dart';
import 'package:tanyadokter_pasien/features/profile/ui/profile_settings_screen.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/chat_session_screen.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/connecting_screen.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/doctor_list.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/method_payment_screen.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/payment_screen.dart';
import 'package:tanyadokter_pasien/features/history/ui/doctors_prescription.dart';
import 'package:tanyadokter_pasien/features/history/ui/history_screen.dart';
import 'package:tanyadokter_pasien/features/home/home_screen.dart';
import 'package:tanyadokter_pasien/features/login/bloc/login_bloc.dart';
import 'package:tanyadokter_pasien/features/login/data/login_api_service.dart';
import 'package:tanyadokter_pasien/features/login/data/login_repository.dart';
import 'package:tanyadokter_pasien/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_pasien/features/reset_password/data/reset_password_api_service.dart';
import 'package:tanyadokter_pasien/features/reset_password/ui/forgot_password_screen.dart';
import 'package:tanyadokter_pasien/features/login/ui/login_screen.dart';
import 'package:tanyadokter_pasien/features/register/bloc/register_bloc.dart';
import 'package:tanyadokter_pasien/features/register/data/register_api_service.dart';
import 'package:tanyadokter_pasien/features/register/data/register_repository.dart';
import 'package:tanyadokter_pasien/features/register/ui/register_screen.dart';
import 'package:tanyadokter_pasien/features/reset_password/ui/pin_verification_screen.dart';
import 'package:tanyadokter_pasien/features/reset_password/ui/reset_password_screen.dart';

import '../features/email_verification/bloc/email_verification_bloc.dart';
import '../features/email_verification/data/email_verification_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final loginApiService = LoginApiService();
    final loginRepository = LoginRepository(loginApiService);
    final registerApiService = RegisterApiService();
    final registerRepository = RegisterRepository(registerApiService);
    final resetPasswordApiService = ResetPasswordApiService(dio);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => loginApiService),
        RepositoryProvider(create: (_) => loginRepository),
        RepositoryProvider(create: (_) => registerApiService),
        RepositoryProvider(create: (_) => registerRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(loginRepository),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(registerRepository),
          ),
          BlocProvider(
            create: (_) => EmailVerificationBloc(EmailVerificationRepository()),
          ),
          BlocProvider(
            create: (_) => ResetPasswordBloc(resetPasswordApiService),
          ),
        ],
        child: MaterialApp(
          title: 'TanyaDokter - Pasien',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(context),
          home: const LoginScreen(),
          initialRoute: '/login',
          routes: {
            '/root': (context) => const RootScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/forgot-password': (context) => ForgotPasswordScreen(),
            '/reset-pin': (context) => ResetVerificationScreen(),
            '/reset-password': (context) => ResetEmailScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            DoctorList.routeName: (context) => const DoctorList(),
            PaymentScreen.routeName: (context) => const PaymentScreen(),
            MethodPaymentScreen.routeName: (context) => MethodPaymentScreen(),
            ConnectingScreen.routeName: (context) => ConnectingScreen(),
            ChatSessionScreen.routeName: (context) => ChatSessionScreen(),
            ProfileSettingsScreen.routeName: (context) =>
                ProfileSettingsScreen(),
            EditProfileScreen.routeName: (context) => EditProfileScreen(),
            DeleteProfileScreen.routeName: (context) => DeleteProfileScreen(),
            AboutScreen.routeName: (context) => AboutScreen(),
            HistoryScreen.routeName: (context) => HistoryScreen(),
            PrescriptionScreen.routeName: (context) => PrescriptionScreen(),
          },
        ),
      ),
    );
  }
}
