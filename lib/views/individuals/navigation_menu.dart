import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/activity.dart';
import 'package:ebin/views/individuals/dispose.dart';
import 'package:ebin/views/individuals/homepage.dart';
import 'package:ebin/views/individuals/profile.dart';
import 'package:flutter/material.dart';

class IndividualNavigationMenu extends StatefulWidget {
  const IndividualNavigationMenu({super.key});

  @override
  State<IndividualNavigationMenu> createState() =>
      _IndividualNavigationMenuState();
}

class _IndividualNavigationMenuState extends State<IndividualNavigationMenu> {
  int index = 0;
  final screens = [
    const IndividualHomePage(),
    const IndividualDisposePage(),
    const IndividualActivityPage(),
    IndividualProfilePage(),
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

class MyCategoryContainerBuilder extends StatelessWidget {
  const MyCategoryContainerBuilder(
      {super.key,
      required this.image,
      required this.categoriesHeading,
      required this.categories});

  final String image;
  final String categories;
  final String categoriesHeading;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = MyAppTextTheme.lightTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
          width: 80,
          height: 80,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          categoriesHeading,
          style: MyAppTextTheme.lightTheme.titleMedium,
          softWrap: true,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          categories,
          style: textTheme.bodyMedium,
          softWrap: true,
        ),
      ],
    );
  }
}
