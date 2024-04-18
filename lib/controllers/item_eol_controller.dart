import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/controllers/notification_controller.dart';
import 'package:ebin/models/end_of_life.dart';
import 'package:ebin/models/item_eol.dart';
import 'package:ebin/models/category.dart';
import 'package:ebin/models/notification_model.dart';
import 'package:ebin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  AuthController authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<ItemEol> items = [
    ItemEol(
      itemName: 'CRT monitors',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/ZiaEAG25VU1DFoRb.standard',
      eol: 5,
      category: ItemCategory.screensAndMonitors,
    ),
    ItemEol(
      itemName: 'Flat Panel Display',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/wM2kRyOS5RVrxUKs.standard',
      eol: 7,
      category: ItemCategory.screensAndMonitors,
    ),
    ItemEol(
      itemName: 'Smart Phones',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/4Tba1Ob6xOYGVFPr.standard',
      eol: 4,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: "computers",
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/ZIOFkHSxJKUAXbok.standard',
      eol: 5,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Laptop',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/2Fw5b5NJLuVgHZT5.standard',
      eol: 5,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Tablets',
      url:
          'https://imgs.search.brave.com/cBBCwsWwT1ulkeG_U8fcGaO1Hdm7egpRgi74UY5KQd8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9H/YWxsZXJ5L1NPTC02/ODc5Mi1UYWJsZXRz/QnV5aW5nR3VpZGUt/QnJhbmRzLVNhbXN1/bmctMTc4NDk2Lmpw/Zw',
      eol: 7,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Printers',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/2DMFPrRlCPd5aSdQ.standard',
      eol: 7,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Routers',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/jVgpFGL5aFDjjGjR.standard',
      eol: 7,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Fax Machines',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/1dvFccM53YUUkoT5.standard',
      eol: 7,
      category: ItemCategory.itEquipments,
    ),
    ItemEol(
      itemName: 'Microwave',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/joYPDKnMa6ndYOra.standard',
      eol: 10,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Toasters',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/IZjNOPVXbUEJTen6.standard',
      eol: 5,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Speakers and Woofers',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/eQyrZrJCsmqMtQCe.standard',
      eol: 8,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Headphones and Earphones',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/coLo3wyMM4q3NFSj.standard',
      eol: 2,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Hand Mixer',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/IalmAokqNNRQnA5d.standard',
      eol: 4,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Vaccum Cleaners',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/RhPvfMAWIFTcAcRa.standard',
      eol: 5,
      category: ItemCategory.smallEquipments,
    ),
    ItemEol(
      itemName: 'Refrigerators',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/OTobQvcACkEOXqnt.standard',
      eol: 15,
      category: ItemCategory.others,
    ),
    ItemEol(
      itemName: 'Flourescent Bulbs',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/TO2KOKWCQwErIOIB.standard',
      eol: 7,
      category: ItemCategory.others,
    ),
    ItemEol(
      itemName: 'Dishwasher',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/SWNvLX2OPtwbZQEm.standard',
      eol: 12,
      category: ItemCategory.others,
    ),
    ItemEol(
      itemName: 'Oven',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/B3RClyjOcIQPEupb.standard',
      eol: 15,
      category: ItemCategory.others,
    ),
    ItemEol(
      itemName: 'Washing Machine',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/xsTFtlYMMNelKanL.standard',
      eol: 12,
      category: ItemCategory.others,
    ),
    ItemEol(
      itemName: 'Air Conditioning Equipments',
      url:
          'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/NjHtoJkyHUqiXAa5.standard',
      eol: 12,
      category: ItemCategory.others,
    ),
  ];

  var selectedDate = DateTime.now().obs;
  var userId = ''.obs;
  final isLoading = false.obs;
  final itemName = ''.obs;
  final brandName = ''.obs;
  final category = ''.obs;
  final eol = ''.obs;
  final yearOfPurchase = ''.obs;
  final selectedItem = Rxn<ItemEol>();
  // final maincategory = ''.obs;
  // final itemData = Rxn<EndOfLife>();
  var itemData = <EndOfLife>[].obs;

  TextEditingController controllerItemName = TextEditingController();
  TextEditingController controllerEol = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerBrand = TextEditingController();

  final notificationController = Get.put(NotificationController());

  @override
  void onInit() {
    ever(selectedItem, (_) {
      debugPrint("Selected Item changed to ${selectedItem.value!.itemName}");
      controllerEol.text = selectedItem.value!.eol.toString();
      controllerItemName.text = selectedItem.value!.itemName;
      controllerDate.text = selectedDate.value.year.toString();
    });
    fetchAllEolItems();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    userId.value = savedUser!.userId;
  }

  @override
  void onClose() {
    super.onClose();
    controllerBrand.clear();
    controllerDate.clear();
    controllerEol.clear();
    controllerItemName.clear();
  }

  //method to validate everything is not empty.
  bool _isValid() {
    if (controllerItemName.text.trim().isEmpty) {
      Get.snackbar(
        'Enter Valid ItemName',
        'Please enter a valid ItemName',
        snackPosition: SnackPosition.BOTTOM,
      );
      // userId = authController.userId.value.toString();
      // debugPrint(userId);

      return false;
    }
    if (controllerBrand.text.trim().isEmpty) {
      Get.snackbar(
        'Enter Valid BrandName',
        "Please enter a valid BrandName",
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    return true;
  }

//method for date and time picker
  void datePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (datePicker != null && datePicker != selectedDate.value) {
      selectedDate.value = datePicker;
      controllerDate.text = selectedDate.value.year.toString();
    }
  }

//method or function to add values to firebase.
  void addEolItem() async {
    brandName.value = controllerBrand.text;
    itemName.value = selectedItem.value!.itemName;
    category.value = selectedItem.value!.category;

    eol.value = selectedItem.value!.eol.toString();
    yearOfPurchase.value = selectedDate.value.year.toString();
    EndOfLife endOfLife = EndOfLife(
      itemName: itemName.value,
      userId: userId.value,
      category: category.value,
      eol: eol.value.toString(),
      isDisposed: false,
      yearOfPurchase: yearOfPurchase.value,
      brandName: brandName.value,
    );
    debugPrint(authController.userId.toString());
    if (_isValid()) {
      isLoading.value = true;
      try {
        await _firestore.collection("eol").doc().set(endOfLife.toMap());
        Get.snackbar('Success Message', 'Items added Successfuly',
            snackPosition: SnackPosition.BOTTOM);
        controllerBrand.clear();
        controllerDate.text = DateTime.now().year.toString();
        selectedDate.value = DateTime.now();
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
        debugPrint(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  //method to fetch data from firebase
  void fetchAllEolItems() async {
    isLoading.value = true;
    try {
      final snapshot = await _firestore.collection('eol').get();
      final itemsData = EndOfLife.fromQuerySnapshot(snapshot);
      for (var element in itemsData) {
        if (remainingPeriod(element)) {
          String id = _firestore.collection('notifications').doc().id;
          NotificationModel notification = NotificationModel(
              id: id,
              senderId: '',
              senderName: '',
              receiverId: authController.userId.value,
              createdAt: DateTime.now(),
              title: 'End of Life Reached',
              description:
                  'Please Dispose ${element.brandName} its end of life has been reached, find alternative ways to dispose');
          notificationController.createNotification(notification);
        }
      }
      itemData.assignAll(itemsData);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool remainingPeriod(EndOfLife element) {
    var currentYear = DateTime.now().year;
    var newTime = int.parse(element.yearOfPurchase) + int.parse(element.eol);

    if (newTime <= currentYear) {
      return true;
    } else {
      return false;
    }
  }
}
