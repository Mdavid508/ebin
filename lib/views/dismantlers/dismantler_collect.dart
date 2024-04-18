import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/dismantlers_controller.dart';
import 'package:ebin/controllers/mapping_controller.dart';
import 'package:ebin/controllers/mpesa_payment.dart';
import 'package:ebin/models/collector_post_sale.dart';
import 'package:ebin/models/mappings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DismantlersCollect extends StatelessWidget {
  DismantlersCollect({super.key});

  final controllerDismantler = Get.put(DismantlersController());
  final controllerMapping = Get.put(MappingController());
  final paymentController = Get.put(MpesaPayment());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collect'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => DropdownButtonFormField(
                  items:
                      controllerMapping.collectorData.map((MappingModel item) {
                    return DropdownMenuItem(
                      value: item.collectorName,
                      child: Text(item.collectorName),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controllerDismantler.setSelected(newValue as String);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controllerDismantler.controllerGetPricePerKg,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Price per Kg'),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerDismantler.controllerWeight,
                decoration: const InputDecoration(labelText: 'Number of Kgs'),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controllerDismantler.controllerAmount,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Total Amount'),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Available Payment method',
                style: MyAppTextTheme.lightTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              ListView(
                shrinkWrap: true,
                children: const <Widget>[Text('Mpesa Payment')],
              ),
              const SizedBox(
                height: 16,
              ),
              FilledButton(
                  onPressed: () async {
                    // await controllerDismantler.getCollectors();
                    await controllerMapping.updateTotalCollectedWeight();
                    try {
                      // await paymentController.payCustomer('0114662464', 20);
                      debugPrint(
                          'update ${controllerDismantler.totalAmount.value}');
                    } on Exception catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Text('Proceed to Payment'))
            ],
          ),
        ),
      ),
    );
  }
}
