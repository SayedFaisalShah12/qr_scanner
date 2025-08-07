import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/image_picker_controller.dart';

class ImagePickerScreen extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File & Camera Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              final file = controller.imageFile.value;
              return file != null
                  ? Image.file(file, height: 200)
                  : const Text('No image selected');
            }),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: controller.pickImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text('Pick from Gallery'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: controller.captureImageFromCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Capture from Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
