import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuktuk/src/presentation/widgets/appbar.dart';

import 'package:tuktuk/src/utils/extensions/check_box.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              TTAppBar(
                onPressedBars: () {},
                iconBar: widget.index == 0
                    ? FontAwesomeIcons.bars
                    : FontAwesomeIcons.angleLeft,
                onPressedVertical: () {},
                iconVertical: FontAwesomeIcons.ellipsisVertical,
                title: 'Home',
              ),
              SizedBox(
                height: size.height,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SearchBar(
                          hintText: 'Search Location',
                          backgroundColor: Colors.transparent.mSPA(),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20).mSPA(),
                          leading: const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                          ),
                          elevation: 0.toDouble().mSPA(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Recents',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 256,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              leading: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              title: Text(
                                'Piplani Petrolpump',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              subtitle: Text(
                                'Bhopal, Madhya Pradesh',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              trailing: const FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Recommanded',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 512,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              leading: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              title: Text(
                                'Piplani Petrolpump',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              subtitle: Text(
                                'Bhopal, Madhya Pradesh',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              trailing: const FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.width / 1.5,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
