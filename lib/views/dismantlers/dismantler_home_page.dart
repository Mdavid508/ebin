import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class DismantlersHomePage extends StatelessWidget {
  const DismantlersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back Almasi Dismantlers'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Collect',
          style: textTheme.labelLarge,
          selectionColor: MyAppColors.primaryColor,
        ),
        icon: const Icon(
          Icons.add,
          color: MyAppColors.primaryColor,
        ),
        backgroundColor: MyAppColors.surfaceLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                DismantlersDetailsContainer(
                  weightInKgs: 7,
                  containerType: 'Collected',
                ),
                DismantlersDetailsContainer(
                  weightInKgs: 17,
                  containerType: 'Disposed',
                ),
                DismantlersDetailsContainer(
                  weightInKgs: 25,
                  containerType: 'Collectors',
                ),
              ],
            ),
            Text(
              'Your Collections',
              style: textTheme.titleMedium,
            ),
            // ListView.builder(itemBuilder: itemBuilder),
          ],
        ),
      ),
    );
  }
}

//containers that will hold the various values.
class DismantlersDetailsContainer extends StatelessWidget {
  const DismantlersDetailsContainer(
      {super.key, required this.weightInKgs, required this.containerType});

  final int weightInKgs;
  final String containerType;

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: MyAppColors.surfaceLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$weightInKgs Kgs',
            style: textTheme.headlineSmall,
          ),
          Text(
            containerType,
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
