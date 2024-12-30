import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tanyadokter_pasien/core/assets/assets_manager.dart';
import 'package:tanyadokter_pasien/core/validator/validator.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';
import 'package:tanyadokter_pasien/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_pasien/features/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_pasien/features/reset_password/bloc/reset_password_state.dart';

class ResetEmailScreen extends StatefulWidget {
  static const routeName = '/reset-password';

  const ResetEmailScreen({super.key});

  @override
  State<ResetEmailScreen> createState() => _ResetEmailScreenState();
}

class _ResetEmailScreenState extends State<ResetEmailScreen> {
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late FocusNode passwordFocusNode;
  late FocusNode repeatPasswordFocusNode;
  bool obsecureText = true;

  @override
  void initState() {
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();

    passwordFocusNode = FocusNode();
    repeatPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email = args['email']!;
    final pin = args['pin']!;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.popUntil(context, ModalRoute.withName('/login'));
          } else if (state is ResetPasswordFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                    const TitleTextWidget(title: 'Ubah Password'),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Silakan masukkan password baru Anda',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(height: 48.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: obsecureText,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          icon: Icon(obsecureText
                              ? Ionicons.eye_off_outline
                              : Ionicons.eye_outline),
                        ),
                        hintText: 'Masukkan password',
                        hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      validator: AppValidator.passwordValidator,
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Ulangi Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: repeatPasswordController,
                      focusNode: repeatPasswordFocusNode,
                      obscureText: obsecureText,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          icon: Icon(obsecureText
                              ? Ionicons.eye_off_outline
                              : Ionicons.eye_outline),
                        ),
                        hintText: 'Ketik ulang password',
                        hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      validator: AppValidator.passwordValidator,
                    ),
                    const SizedBox(height: 24.0),
                    state is ResetPasswordLoading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ResetPasswordBloc>(context).add(
                                NewPasswordEvent(
                                  email,
                                  pin,
                                  passwordController.text,
                                ),
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
                              'Ubah Password',
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
                            onTap: () {},
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
      )),
    );
  }
}
