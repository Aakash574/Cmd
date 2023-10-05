import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tuktuk/src/presentation/widgets/buttons.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

class LocationPermission extends StatefulWidget {
  const LocationPermission({super.key});

  @override
  State<LocationPermission> createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TTBackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(height: 84),
                    Image.asset(
                      'assets/images/logo/tuk_tuk.png',
                      scale: 8,
                    ),
                    const SizedBox(height: 56),
                    Text(
                      'Location permission not enabled',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sharing Location permission helps us improve your ride finding and pickup experience.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.white,
                  size: 156,
                ),
                Column(
                  children: [
                    TTButton(
                      size: size,
                      title: 'Allow Permission',
                      context: context,
                      onTap: () {
                        Navigator.pushNamed(context, '/tuktuk');
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter Location Manually',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: TtColors.successMaterialColor.shade400,
                              ),
                        ),
                      ],
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
