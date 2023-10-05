import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tuktuk/src/presentation/widgets/appbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Map<String, dynamic>> profile = [
    {
      'Categories': {
        'Name': [
          'Notifications',
          'Location',
          'Feedback',
        ],
        'Icons': [
          FontAwesomeIcons.clock,
          FontAwesomeIcons.locationDot,
          FontAwesomeIcons.comment,
        ],
        'Navigation': [
          '/notificationScreen',
          '/locationScreen',
          '/feedbackScreen',
        ]
      },
      'About Us': {
        'Name': [
          'About Us',
          'Privacy Policy',
          'Contact Us',
        ],
        'Icons': [
          FontAwesomeIcons.phone,
          FontAwesomeIcons.shield,
          FontAwesomeIcons.headset,
        ],
        'Navigation': [
          '/aboutUs',
          '/contactUs',
          '/privacyPolicy',
        ]
      }
    }
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TTAppBar(
                  onPressedBars: () {},
                  onPressedVertical: () {},
                  iconVertical: FontAwesomeIcons.ellipsisVertical,
                  iconBar: FontAwesomeIcons.bars,
                  title: 'Profile',
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 128,
                          width: 128,
                          decoration: BoxDecoration(
                            border: Border.all(width: 8, color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 64,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Latina John',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Section(context: context, title: 'General'),
                        SizedBox(
                          height: 64,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return SubSections(
                                context: context,
                                icon: FontAwesomeIcons.pen,
                                title: 'Edit Profile',
                                onTap: '/editProfile',
                              );
                            },
                          ),
                        ),
                        Section(context: context, title: 'Categories'),
                        SizedBox(
                          height: 174,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SubSections(
                                context: context,
                                icon: profile[0]['Categories']['Icons'][index],
                                title: profile[0]['Categories']['Name'][index],
                                onTap: profile[0]['Categories']['Navigation']
                                    [index],
                              );
                            },
                          ),
                        ),
                        Section(context: context, title: 'About us'),
                        SizedBox(
                          height: 192,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SubSections(
                                context: context,
                                icon: profile[0]['About Us']['Icons'][index],
                                title: profile[0]['About Us']['Name'][index],
                                onTap: profile[0]['About Us']['Navigation']
                                    [index],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height / 3,
                        ),
                      ],
                    ),
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

class SubSections extends StatelessWidget {
  const SubSections({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final BuildContext context;
  final IconData icon;
  final String title;
  final String onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, onTap),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 36),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        trailing: const FaIcon(
          FontAwesomeIcons.angleRight,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.context,
    required this.title,
  });

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 26,
        width: 26,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const FaIcon(
          FontAwesomeIcons.hashtag,
          size: 16,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
