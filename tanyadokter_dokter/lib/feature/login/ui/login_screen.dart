import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/assets/assets_manager.dart';
import '../../../core/validator/validator.dart';
import '../../../core/widget/title_text_widget.dart';

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
  bool isLoading = false;

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
    if (mounted) {
      emailController.dispose();
      passwordController.dispose();
      emailFocusNode.dispose();
      passwordFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                    AssetsManager.loginImage,
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
                const SizedBox(height: 36.0),
                const TitleTextWidget(title: 'Masuk'),
                const SizedBox(height: 24.0),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan email',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
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
                  obscureText: obsecureText,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    return AppValidator.passwordValidator(value);
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
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
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    SizedBox(width: 8.0),
                    Text('Atau'),
                    SizedBox(width: 8.0),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12.0),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.circle),
                  label: const Text('Masuk dengan Google'),
                  style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 40.0),
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Belum punya akun? ',
                        style: TextStyle(fontSize: 11.0),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/register');
                        },
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
    );
  }
}
