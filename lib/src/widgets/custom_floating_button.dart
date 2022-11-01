import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_scanner/src/utils/utils.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () => scanQR(context, scanListProvider),
    );
  }

  Future<void> scanQR(
      BuildContext context, ScanListProvider scanListProvider) async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF', 'Cancel', false, ScanMode.QR);
      if (barcodeScanRes == '-1') return;

      final scan = await scanListProvider.saveScan(barcodeScanRes);

      redirect(context, scan);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
