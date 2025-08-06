import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scaaner/route/app_page.dart';
import 'package:qr_scaaner/route/app_route.dart';

void main() {
  runApp(const QRScannerApp());
}

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Scanner App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.qrScanner,
      getPages: AppPages.pages,
    );
  }
}
