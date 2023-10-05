import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tuktuk/src/presentation/widgets/buttons.dart';
import 'package:tuktuk/src/presentation/widgets/textfields.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';
import 'package:tuktuk/src/utils/extensions/check_box.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 96),
                Image.asset(
                  'assets/images/logo/tuk_tuk.png',
                  scale: 8,
                ),
                const SizedBox(height: 48),
                const TTTextFields(
                  hintText: 'Enter Your Name',
                  prefix: '',
                  textInputType: TextInputType.name,
                  length: 20,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gender',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectGender(context, 'Male', FontAwesomeIcons.mars),
                    selectGender(context, 'Female', FontAwesomeIcons.venus),
                    selectGender(
                        context, 'other', FontAwesomeIcons.marsAndVenus),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      fillColor: Colors.white.mSPA(),
                      checkColor: TtColors.successMaterialColor,
                    ),
                    Text(
                      'I have referral code',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isActive,
                  child: SizedBox(
                    width: size.width - 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Referral Code',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                TTButton(
                  size: size,
                  title: 'Continue',
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(context, '/tuktuk');
                  },
                ),
                const SizedBox(height: 20),
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

  mSPA(dynamic value) {
    return MaterialStatePropertyAll(value);
  }

  Container selectGender(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Container(
      width: 112,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
