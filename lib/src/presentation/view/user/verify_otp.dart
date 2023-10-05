import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tuktuk/src/presentation/widgets/buttons.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: size.height - 100,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TTBackButton(
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 96),
                  Image.asset(
                    'assets/images/logo/tuk_tuk.png',
                    scale: 8,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Enter the OTP',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We have sent the otp to +91 7000 649 593',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      SizedBox(
                        width: size.width - 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            otpField(otp1),
                            otpField(otp2),
                            otpField(otp3),
                            otpField(otp4),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width - 100,
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.spinner,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Verifying OTP...',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              'Resend OTP in  3 s',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TTButton(
                    size: size,
                    title: 'Proceed',
                    context: context,
                    onTap: () {
                      Navigator.pushNamed(context, '/addDetails');
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Term and Conditions? ',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        'T&C',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: TtColors.successMaterialColor.shade400,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget otpField(TextEditingController controller) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
