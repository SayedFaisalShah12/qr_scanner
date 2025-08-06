import 'package:get/get.dart';

class QrScannerController extends GetxController {
  var scannedText = ''.obs;
  var isLoading = false.obs;

  void processScan(String qrContent) {
    isLoading.value = true;

    // Simulate processing
    Future.delayed(Duration(seconds: 1), () {
      scannedText.value = qrContent;
      isLoading.value = false;
    });
  }

  void clear() {
    scannedText.value = '';
  }
}
