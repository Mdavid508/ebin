import 'package:ebin/constants/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final ImagePicker imagepicker = ImagePicker();
  List<XFile>? imageFileList = []; //stores the images.
  RxList<String> listImagePath = <String>[].obs;
  RxList<String> uploadedImageUrls = <String>[].obs;
  final isloading = false.obs;
  final selectedFileCount = 0.obs;

  // Firebase Storage instance
  final firebaseStorage = FirebaseStorage.instance;

  selectImages() async {
    imageFileList = await imagepicker.pickMultiImage();
    if (imageFileList != null) {
      for (XFile file in imageFileList!) {
        listImagePath.add(file.path);
      }
    } else {
      Get.snackbar('Failed', 'No images Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: MyAppColors.secondaryColor);
    }
    selectedFileCount.value = listImagePath.length;
  }

  //upload images.
  Future<void> uploadImages() async {
    isloading.value = true;
    for (String imagePath in listImagePath) {
      File file = File(imagePath);

      try {
        // Create a reference to the location you want to upload to in Firebase Storage
        Reference storageReference =
            firebaseStorage.ref('/images/${path.basename(file.path)}');

        // Upload the file to Firebase Storage
        UploadTask uploadTask = storageReference.putFile(file);

        // Wait until the file is uploaded
        await uploadTask.whenComplete(() => debugPrint('File Uploaded'));

        //get Download url;
        String downloadURL = await storageReference.getDownloadURL();
        uploadedImageUrls.add(downloadURL);

        Get.snackbar("Upload Success",
            'Successfully uploaded file to Firebase Storage at ${storageReference.fullPath}');
      } catch (e) {
        // e.g, e.toString()
        Get.snackbar("Upload Error",
            'Failed to upload file to Firebase Storage with error $e');
        isloading.value = false;
      }
    }
    isloading.value = false;
  }
}
