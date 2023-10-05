import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuktuk/src/presentation/widgets/appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TTAppBar(
                onPressedBars: () {},
                onPressedVertical: () {},
                iconVertical: FontAwesomeIcons.ellipsisVertical,
                iconBar: FontAwesomeIcons.angleLeft,
                title: 'Map',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
