import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tuktuk/src/presentation/widgets/buttons.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNo = '';
  Country selectedCountry = Country(
      phoneCode: '91',
      countryCode: 'IN',
      e164Sc: 0,
      geographic: true,
      level: 0,
      name: 'India',
      example: 'India',
      displayName: 'IN',
      displayNameNoCountryCode: 'IN',
      e164Key: '0');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TTBackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 108),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo/tuk_tuk.png',
                      scale: 6,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 84),
                    Container(
                      width: size.width,
                      height: 64,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () => showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 500,
                          ),
                          onSelect: (value) => selectedCountry,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    phoneNo = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone No',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12.0,
                                      left: 12,
                                      bottom: 12,
                                    ),
                                    child: phoneNo.length < 10
                                        ? const FaIcon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.red,
                                          )
                                        : const FaIcon(
                                            FontAwesomeIcons.check,
                                            color: Colors.green,
                                          ),
                                  ),
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                              ),
                            ),
                          ],
                        ),
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
                    if (phoneNo.length != 10) {
                      Fluttertoast.showToast(msg: 'Invalid No.');
                    } else {
                      Navigator.pushNamed(context, '/verifyOtp');
                    }
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Term and Conditions? ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
    );
  }
}
