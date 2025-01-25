import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/root_screen.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/constant/app_theme.dart';
import 'package:tanyadokter_pasien/features/auth/email_verification/bloc/email_verification_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/email_verification/data/email_verification_repository.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/login/data/login_api.dart';
import 'package:tanyadokter_pasien/features/auth/login/data/login_repository.dart';
import 'package:tanyadokter_pasien/features/auth/login/ui/login_screen.dart';
import 'package:tanyadokter_pasien/features/auth/register/bloc/register_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/register/data/register_api_service.dart';
import 'package:tanyadokter_pasien/features/auth/register/data/register_repository.dart';
import 'package:tanyadokter_pasien/features/auth/register/ui/register_screen.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/data/reset_password_api_service.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/ui/forgot_password_screen.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/ui/pin_verification_screen.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/data/chat_repository.dart';
import 'package:tanyadokter_pasien/features/consultation/connecting_screen.dart';
import 'package:tanyadokter_pasien/features/category_list/views/ui/category_screen.dart';
import 'package:tanyadokter_pasien/features/payment/views/ui/payment_confirmation_screen.dart';
import 'package:tanyadokter_pasien/features/history/ui/prescription_screen.dart';
import 'package:tanyadokter_pasien/features/history/ui/history_screen.dart';
import 'package:tanyadokter_pasien/features/home/ui/home_screen.dart';
import 'package:tanyadokter_pasien/features/payment/bloc/payment_bloc.dart';
import 'package:tanyadokter_pasien/features/profile/profile_screen/ui/about_screen.dart';
import 'package:tanyadokter_pasien/features/profile/delete_profile/ui/delete_profile.dart';
import 'package:tanyadokter_pasien/features/profile/edit_profile/ui/edit_profile.dart';
import 'package:tanyadokter_pasien/features/profile/profile_screen/ui/profile_screen.dart';
import 'package:tanyadokter_pasien/features/profile/profile_settings/ui/profile_settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final session = await SessionHelper.getUserSession();

  runApp(
    MyApp(
      isLoggedIn: session["token"] != null,
    ),
  );
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
    final loginApiService = LoginApiService(dio);
    final loginRepository = LoginRepository(loginApiService);
    final registerApiService = RegisterApiService();
    final registerRepository = RegisterRepository(registerApiService);
    final resetPasswordApiService = ResetPasswordApiService(dio);
    final chatRepository = ChatRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => loginApiService),
        RepositoryProvider(create: (_) => loginRepository),
        RepositoryProvider(create: (_) => registerApiService),
        RepositoryProvider(create: (_) => registerRepository),
        RepositoryProvider(create: (_) => chatRepository),
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
          BlocProvider(
            create: (_) => PaymentBloc(),
          ),
          BlocProvider(create: (_) => ChatBloc(repository: chatRepository))
        ],
        child: MaterialApp(
          title: 'TanyaDokter - Pasien',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(context),
          home: const LoginScreen(),
          initialRoute: isLoggedIn ? '/root' : '/login',
          // '/chat',
          // '/root'
          // isLoggedIn ? '/root' : '/login',
          routes: {
            '/root': (context) => const RootScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/forgot-password': (context) => ForgotPasswordScreen(),
            '/reset-pin': (context) => ResetVerificationScreen(),
            '/reset-password': (context) => ResetEmailScreen(),
            '/dashboard': (context) => HomeScreen(),
            '/profile': (context) => ProfileScreen(),
            // '/chat': (context) => ChatPage(receiverId: '5'),
            '/connect': (context) => ConnectingScreen(),
            '/category': (context) => CategoryScreen(),
            '/payment-confirm': (context) => PaymentConfirmScreen(),
            '/profile-settings': (context) => ProfileSettingsScreen(),
            '/edit': (context) => EditProfileScreen(),
            '/delete': (context) => DeleteProfileScreen(),
            '/about': (context) => AboutScreen(),
            '/history': (context) => HistoryScreen(),
            '/resep': (context) => PrescriptionScreen(),
          },
        ),
      ),
    );
  }
}
