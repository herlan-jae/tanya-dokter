import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/core/assets/assets_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';

class ResetVerificationScreen extends StatefulWidget {
  static const routeName = '/reset-pin';

  const ResetVerificationScreen({super.key});

  @override
  State<ResetVerificationScreen> createState() =>
      _ResetVerificationScreenState();
}

class _ResetVerificationScreenState extends State<ResetVerificationScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    const int pinLength = 6;
    const Color fillColor = Colors.white;
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: borderRadius,
        border: Border.all(),
      ),
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.0,
                  child: Image.asset(AssetsManager.logo),
                ),
                const SizedBox(height: 48.0),
                const TitleTextWidget(title: 'Verifikasi OTP'),
                const SizedBox(height: 12.0),
                Text(
                  'Kode OTP telah dikirimkan ke email',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.0,
                  ),
                ),
                const SizedBox(height: 48.0),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Pinput(
                        length: pinLength,
                        controller: pinController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: Colors.red.shade50,
                            border: Border.all(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Tidak mendapat OTP? ',
                            style: TextStyle(fontSize: 11.0),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Kirim ulang',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 11.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/reset-password',
                            arguments: {
                              'email': email,
                              'pin': pinController.text
                            },
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
                          'Lanjutkan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
