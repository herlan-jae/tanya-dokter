import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tanyadokter_dokter/constant/alert_dialog_widget.dart';
import 'package:tanyadokter_dokter/constant/assets_manager.dart';
import 'package:tanyadokter_dokter/constant/title_text_widget.dart';
import 'package:tanyadokter_dokter/constant/validator.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/reset-password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late FocusNode passwordFocusNode;
  late FocusNode repeatPasswordFocusNode;
  final formKey = GlobalKey<FormState>();
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
  void dispose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email = args['email']!;
    final pin = args['pin']!;

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswodSucces) {
            showDialog(
              context: context,
              builder: (context) => AlertDialogSuccess(
                label: "Berhasil mengubah password",
                function: () {
                  Navigator.popUntil(context, ModalRoute.withName('/login'));
                },
              ),
            );
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
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
                                fontSize: 11.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: const TextStyle(fontSize: 11.0),
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
                                fontSize: 11.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: const TextStyle(fontSize: 11.0),
                            validator: AppValidator.passwordValidator,
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
                                NewPassword(
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
      )),
    );
  }
}
