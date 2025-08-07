import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:qr_scaaner/route/app_page.dart';
import 'package:qr_scaaner/route/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const QRScannerApp(),
    ),
  );
}

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Scanner',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // 👈 required for DevicePreview
      locale: DevicePreview.locale(context), // 👈 required for locale testing
      builder: DevicePreview.appBuilder, // 👈 required for wrapping
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.qrScanner,
      getPages: AppPages.pages,
    );
  }
}
