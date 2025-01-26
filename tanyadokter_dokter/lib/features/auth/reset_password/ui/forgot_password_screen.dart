import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tanyadokter_dokter/constant/alert_dialog_widget.dart';
import 'package:tanyadokter_dokter/constant/app_constant.dart';
import 'package:tanyadokter_dokter/constant/assets_manager.dart';
import 'package:tanyadokter_dokter/constant/title_text_widget.dart';
import 'package:tanyadokter_dokter/constant/validator.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';

  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController emailController;
  late final FocusNode emailFocusNode;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswodSucces) {
              if (mounted) {
                Navigator.of(context).pushNamed(
                  '/reset-pin',
                  arguments: emailController.text,
                );
              }
            } else if (state is ResetPasswordFailed) {
              showDialog(
                context: context,
                builder: (context) => AlertDialogFailed(
                  label: state.error,
                  function: () {
                    Navigator.of(context).pop();
                  },
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
                        height: size.height * 0.07,
                        child: Image.asset(
                          AssetsManager.logo,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetsManager.forgotPasswordImage,
                          height: size.height * 0.30,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      const TitleTextWidget(title: 'Lupa Password'),
                      const SizedBox(height: 18.0),
                      const Text(
                        'Masukkan email Anda untuk Reset Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email', style: AppConstant.labelStyle),
                            const SizedBox(height: 8.0),
                            TextFormField(
                              controller: emailController,
                              focusNode: emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'Masukkan email',
                                hintStyle: TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.grey,
                                ),
                              ),
                              style: const TextStyle(fontSize: 11.0),
                              validator: (value) =>
                                  AppValidator.emailValidator(value),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      state is ResetPasswordLoading
                          ? ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 4.0,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 40.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              child: const SpinKitWave(
                                color: Colors.white,
                                size: 20.0,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ResetPasswordBloc>(context).add(
                                  VerifyEmail(emailController.text),
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
