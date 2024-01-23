import 'package:flutter/material.dart';

class IndividualActivityPage extends StatefulWidget {
  const IndividualActivityPage({super.key});

  @override
  State<IndividualActivityPage> createState() => _IndividualActivityPageState();
}

class _IndividualActivityPageState extends State<IndividualActivityPage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              enabled: false,
              decoration:
                  InputDecoration(labelText: selectedDate.year.toString()),
            ),
            MaterialButton(
                onPressed: () async {
                  DateTime? datePicker = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
                  if (datePicker != null && datePicker != selectedDate) {
                    setState(() {
                      selectedDate = datePicker;
                    });
                  }
                },
                child: const Text("Activity page")),
          ],
        ),
      ),
    );
  }
}
