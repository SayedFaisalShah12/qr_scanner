import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class QrScannerController extends GetxController {
  final imagePath = ''.obs;
  final picker = ImagePicker();

  void openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.single.path != null) {
      imagePath.value = result.files.single.path!;
    }
  }

  File getImageFile() {
    return File(imagePath.value);
  }
}
