import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/dismantlers/dismanter_dispose.dart';
import 'package:ebin/views/dismantlers/dismantler_home_page.dart';
import 'package:ebin/views/dismantlers/dismantler_profile.dart';
import 'package:ebin/profile_page.dart';
import 'package:flutter/material.dart';

class DismantlerNavigationMenu extends StatefulWidget {
  const DismantlerNavigationMenu({super.key});

  @override
  State<DismantlerNavigationMenu> createState() =>
      _DismantlerNavigationMenuState();
}

class _DismantlerNavigationMenuState extends State<DismantlerNavigationMenu> {
  int index = 0;
  final screens = [
    const DismantlersHomePage(),
    const DismantlerDispose(),
    const DismantlerDispose(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        animationDuration: const Duration(seconds: 2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home_filled,
              color: MyAppColors.onSurfaceVariant,
            ),
          ),
          NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Dispose',
              selectedIcon: Icon(
                Icons.add,
                color: MyAppColors.onSurfaceVariant,
              )),
          NavigationDestination(
              icon: Icon(Icons.local_activity_outlined),
              label: 'Activity',
              selectedIcon: Icon(
                Icons.local_activity,
                color: MyAppColors.onSurfaceVariant,
              )),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              label: 'Account',
              selectedIcon: Icon(
                Icons.person_2,
                color: MyAppColors.onSurfaceVariant,
              )),
        ],
        height: 80,
      ),
    );
  }
}
