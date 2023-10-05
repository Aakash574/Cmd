import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuktuk/src/presentation/view/Dashboard/dashboard.dart';
import 'package:tuktuk/src/presentation/view/Map/map.dart';
import 'package:tuktuk/src/presentation/view/Profile/profile.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

class TukTuk extends StatefulWidget {
  const TukTuk({super.key});

  @override
  State<TukTuk> createState() => _TukTukState();
}

class _TukTukState extends State<TukTuk> {
  int index = 1;
  bool b1 = false;
  bool b2 = true;
  bool b3 = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> sections = [
      Dashboard(index: index),
      const MapScreen(),
      const Profile()
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            margin: const EdgeInsets.only(top: 50),
            child: sections[index],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 84,
              width: size.width / 1.5,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 60),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: TtColors.ttPrimaryColor.shade800,
                border: Border.all(width: 1, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 126,
              width: size.width / 1.4,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarIcons(
                    icon: FontAwesomeIcons.house,
                    active: b1,
                    index: index,
                    onTap: () {
                      setState(() {
                        index = 0;
                        b1 = true;
                        b2 = false;
                        b3 = false;
                      });
                    },
                  ),
                  AppBarIcons(
                    icon: FontAwesomeIcons.solidMap,
                    active: b2,
                    index: index,
                    onTap: () {
                      setState(() {
                        index = 1;
                        b1 = false;
                        b2 = true;
                        b3 = false;
                      });
                    },
                  ),
                  AppBarIcons(
                    icon: FontAwesomeIcons.solidUser,
                    active: b3,
                    index: index,
                    onTap: () {
                      setState(() {
                        index = 2;
                        b1 = false;
                        b2 = false;
                        b3 = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key,
    required this.icon,
    required this.active,
    required this.index,
    required this.onTap,
  });

  final IconData icon;
  final bool active;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: active
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 10),
              height: 116,
              width: 116,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
                color: active
                    ? TtColors.ttPrimaryColor.shade800
                    : Colors.transparent,
              ),
              child: Container(
                height: active ? 64 : 48,
                width: active ? 64 : 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TtColors.successMaterialColor,
                ),
                child: FaIcon(
                  icon,
                ),
              ),
            ).animate(target: active ? 1 : 0).scaleXY(begin: 0.9, end: 1)
          : AnimatedContainer(
              duration: const Duration(milliseconds: 10),
              height: 56,
              width: 56,
              margin: EdgeInsets.only(
                  right: active && index == 0
                      ? active && index == 1
                          ? 14
                          : 0
                      : 14,
                  left: active && index == 2
                      ? active && index == 1
                          ? 14
                          : 0
                      : 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: TtColors.successMaterialColor,
              ),
              child: FaIcon(
                icon,
                size: 16,
              ),
            ).animate(target: active ? 1 : 0).fade(begin: 0.8, end: 1),
    );
  }
}
