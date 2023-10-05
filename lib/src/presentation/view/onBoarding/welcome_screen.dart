import 'package:flutter/material.dart';

import 'package:tuktuk/src/presentation/widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/tuktuk/tuktuk.png',
                  scale: 1.8,
                ),
                Text(
                  "Discover the City with Tuk Tuk Taxi – Your Shortcut to Urban Adventures!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                TTButton(
                  size: size,
                  title: 'Get Started',
                  context: context,
                  onTap: () => Navigator.pushNamed(context, '/login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
