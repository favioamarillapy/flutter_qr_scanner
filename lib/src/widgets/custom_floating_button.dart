import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.saveScan("http://localhost.com");
        scanListProvider.saveScan("gro:15.33,15.66");

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     "#3D8BEF", "Cancel", false, ScanMode.QR);

        // FlutterBarcodeScanner.getBarcodeStreamReceiver(
        //         "#ff6666", "Cancel", false, ScanMode.DEFAULT)
        //     .listen((barcode) {

        // });
      },
    );
  }
}
