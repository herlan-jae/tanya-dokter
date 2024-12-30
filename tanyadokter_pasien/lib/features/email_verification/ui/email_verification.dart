import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/core/assets/assets_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:tanyadokter_pasien/core/widget/title_text_widget.dart';
import 'package:tanyadokter_pasien/features/email_verification/bloc/email_verification_bloc.dart';
import 'package:tanyadokter_pasien/features/email_verification/bloc/email_verification_event.dart';
import 'package:tanyadokter_pasien/features/email_verification/bloc/email_verification_state.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    context
        .read<EmailVerificationBloc>()
        .add(SendVerificationPIN(email: widget.email));
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocListener<EmailVerificationBloc, EmailVerificationState>(
              listener: (context, state) {
                if (state is EmailVerificationSuccess) {
                  Navigator.pushNamed(context, '/login');
                } else if (state is EmailVerificationFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
                builder: (context, state) {
                  if (state is EmailVerificationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
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
                        'Kode OTP telah dikirimkan ke email ${widget.email}',
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
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
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
                                  onTap: () {
                                    context
                                        .read<EmailVerificationBloc>()
                                        .add(ResendPIN(email: widget.email));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Kode OTP telah dikirim ulang.')),
                                    );
                                  },
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
                                final pin = pinController.text.trim();
                                if (pin.length == pinLength) {
                                  context.read<EmailVerificationBloc>().add(
                                      VerifyPIN(email: widget.email, pin: pin));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Masukkan kode OTP dengan benar.'),
                                    ),
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
                                'Kirim',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
