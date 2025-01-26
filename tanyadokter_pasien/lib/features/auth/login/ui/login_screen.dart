import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tanyadokter_pasien/core/constant/app_constant.dart';
import 'package:tanyadokter_pasien/core/constant/assets_manager.dart';
import 'package:tanyadokter_pasien/core/constant/validator.dart';
import 'package:tanyadokter_pasien/core/widget/alert_dialog_widget.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_event.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  bool obsecureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (mounted) {
                Navigator.of(context).pushReplacementNamed('/root');
              }
            } else if (state is LoginFailed) {
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
          child: SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.07,
                    child: Image.asset(AssetsManager.logo),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsManager.loginImage,
                      height: size.height * 0.30,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const TitleTextWidget(title: 'Masuk'),
                  const SizedBox(height: 18.0),
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
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Masukkan email',
                            hintStyle: const TextStyle(
                                fontSize: 11.0, color: Colors.grey),
                          ),
                          style: TextStyle(fontSize: 11.0),
                          validator: (value) =>
                              AppValidator.emailValidator(value),
                          onFieldSubmitted: (value) => FocusScope.of(context)
                              .requestFocus(passwordFocusNode),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Password',
                                style: AppConstant.labelStyle),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed('/forgot-password'),
                              child: const Text(
                                'Lupa Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => obsecureText = !obsecureText);
                              },
                              icon: Icon(
                                obsecureText
                                    ? Ionicons.eye_off_outline
                                    : Ionicons.eye_outline,
                              ),
                            ),
                            hintText: 'Masukkan password',
                            hintStyle: const TextStyle(
                                fontSize: 11.0, color: Colors.grey),
                          ),
                          style: TextStyle(fontSize: 11.0),
                          obscureText: obsecureText,
                          validator: (value) =>
                              AppValidator.passwordValidator(value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;
                        context.read<LoginBloc>().add(
                              LoginSubmitted(email: email, password: password),
                            );
                      }
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
                      'Masuk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Belum punya akun? ',
                            style: TextStyle(fontSize: 11.0)),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/register'),
                          child: const Text(
                            'Buat akun',
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
        ),
      ),
    );
  }
}
