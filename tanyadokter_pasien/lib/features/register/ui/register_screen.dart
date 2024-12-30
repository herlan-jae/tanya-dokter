import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tanyadokter_pasien/core/assets/assets_manager.dart';
import 'package:tanyadokter_pasien/core/validator/validator.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';
import 'package:tanyadokter_pasien/features/email_verification/ui/email_verification.dart';
import 'package:tanyadokter_pasien/features/login/ui/login_screen.dart';
import 'package:tanyadokter_pasien/features/register/bloc/register_bloc.dart';
import 'package:tanyadokter_pasien/features/register/bloc/register_event.dart';
import 'package:tanyadokter_pasien/features/register/bloc/register_state.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controller
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late TextEditingController genderController;

  // Focus Node
  late final FocusNode nameFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode repeatPasswordFocusNode;
  late final FocusNode genderFocusNode;

  String? selectedGender;
  bool obsecureText = true;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    genderController = TextEditingController();

    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    repeatPasswordFocusNode = FocusNode();
    genderFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    genderController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();
    genderFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSucces) {
              Navigator.of(context).pushNamed('/root');
            } else if (state is RegisterFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        SizedBox(
                          height: 70.0,
                          child: Image.asset(
                            AssetsManager.logo,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        // Register Image
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetsManager.registerImage,
                            height: 180.0,
                            width: 180.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const TitleTextWidget(title: 'Register'),
                        const SizedBox(height: 24.0),
                        // Nama Lengkap
                        const Text('Nama Lengkap',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.0)),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: nameController,
                          focusNode: nameFocusNode,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Masukkan nama lengkap',
                            hintStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
                          validator: (value) {
                            return AppValidator.repeatPasswordValidator(
                                value: passwordController.text);
                          },
                        ),
                        const SizedBox(height: 12.0),
                        const Text('Jenis Kelamin',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.0)),
                        const SizedBox(height: 8.0),
                        DropdownButtonFormField<String>(
                          value: genderController.text.isNotEmpty &&
                                  (genderController.text == 'M' ||
                                      genderController.text == 'F')
                              ? genderController.text
                              : null,
                          focusNode: genderFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Pilih opsi',
                            hintStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12.0),
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                          isDense: true,
                          items: [
                            DropdownMenuItem(value: 'm', child: Text('Pria')),
                            DropdownMenuItem(value: 'f', child: Text('Wanita')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              genderController.text = value;
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan pilih jenis kelamin';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 12.0),
                        const Text('Email',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.0)),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Masukkan email',
                            hintStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          },
                          validator: AppValidator.emailValidator,
                        ),
                        const SizedBox(height: 12.0),
                        // Password
                        const Text('Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.0)),
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
                        const Text('Ulangi Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.0)),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: repeatPasswordController,
                          focusNode: repeatPasswordFocusNode,
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
                          obscureText: obsecureText,
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            return AppValidator.repeatPasswordValidator();
                          },
                        ),
                        const SizedBox(height: 24.0),
                        // Button
                        ElevatedButton(
                          onPressed: () {
                            final fullname = nameController.text;
                            final gender = genderController.text;
                            final email = emailController.text.trim();
                            final password = passwordController.text;

                            context.read<RegisterBloc>().add(
                                  RegisterSubmitted(
                                    fullname: fullname,
                                    gender: gender,
                                    email: email,
                                    password: password,
                                  ),
                                );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmailVerificationScreen(email: email),
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
                            'Daftar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Sudah punya akun? ',
                                style: TextStyle(fontSize: 11.0),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(LoginScreen.routeName);
                                },
                                child: const Text(
                                  'Login sekarang',
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
            );
          }),
        ),
      ),
    );
  }
}
