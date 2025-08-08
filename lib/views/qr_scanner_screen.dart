import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/qr_scanner_controller.dart';

class QrScannerView extends GetView<QrScannerController> {
  const QrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: controller.pickFile,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload File'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: controller.openCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Camera'),
                ),
                const SizedBox(height: 40),
                Obx(() {
                  if (controller.imagePath.value.isNotEmpty) {
                    return Image.file(
                      controller.getImageFile(),
                      height: 200,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const Text('No file selected');
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
