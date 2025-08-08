import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_picker_controller.dart';

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
              final pickedFile = controller.imageFile.value;

              if (pickedFile == null) {
                return const Text('No image selected');
              }

              if (kIsWeb) {
                // For Web, we expect Uint8List
                return Image.memory(
                  pickedFile as Uint8List,
                  height: 200,
                  fit: BoxFit.cover,
                );
              } else {
                // For Mobile/desktop
                return Image.file(
                  pickedFile as File,
                  height: 200,
                  fit: BoxFit.cover,
                );
              }
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
