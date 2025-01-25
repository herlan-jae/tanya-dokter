import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/core/constant/assets_manager.dart';
import 'package:tanyadokter_pasien/core/widget/auth_text_field.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';

  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              Navigator.of(context).pushNamed(
                '/reset-pin',
                arguments: emailController.text,
              );
            } else if (state is ResetPasswordFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70.0,
                        child: Image.asset(
                          AssetsManager.logo,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetsManager.forgotPasswordImage,
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                      const SizedBox(height: 36.0),
                      const TitleTextWidget(title: 'Lupa Password'),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Masukkan email Anda untuk Reset Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      AuthTextField(
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        hintText: 'Masukkan email',
                        actionType: TextInputAction.done,
                      ),
                      const SizedBox(height: 24.0),
                      state is ResetPasswordLoading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ResetPasswordBloc>(context).add(
                                  VerifyEmailEvent(emailController.text),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 4.0,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 40.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              child: const Text(
                                'Kirim',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                      const SizedBox(height: 48.0),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Kembali ke halaman ',
                              style: TextStyle(fontSize: 11.0),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/login');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 11.0,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
