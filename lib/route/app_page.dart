import 'package:get/get.dart';
import '../binding/qr_scanner_binding.dart';
import '../views/qr_scanner_screen.dart';
import '../views/image_picker_screen.dart';
import 'app_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.qrScanner,
      page: () => const QrScannerScreen(),
      binding: QrScannerBinding(),
    ),
    GetPage(
      name: '/image-picker',
      page: () => ImagePickerScreen(),
    ),

  ];
}
