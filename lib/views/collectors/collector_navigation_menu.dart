import 'package:ebin/constants/colors.dart';
import 'package:ebin/profile_page.dart';
import 'package:ebin/views/collectors/collectors_dispose.dart';
import 'package:ebin/views/collectors/collectors_home_page.dart';
import 'package:flutter/material.dart';

class CollectorNavigationMenu extends StatefulWidget {
  const CollectorNavigationMenu({super.key});

  @override
  State<CollectorNavigationMenu> createState() =>
      _CollectorNavigationMenuState();
}

class _CollectorNavigationMenuState extends State<CollectorNavigationMenu> {
  int index = 0;
  final screens = [
    CollectorsHomePage(),
    CollectorDispose(),
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
              label: 'Sell',
              selectedIcon: Icon(
                Icons.add,
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
