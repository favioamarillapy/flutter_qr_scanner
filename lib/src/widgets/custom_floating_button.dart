import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/src/models/scan_model.dart';
import 'package:flutter_qr_scanner/src/utils/utils.dart';
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

        final barCodeScan = "geo:-25.413613,-57.297989";
        if (barCodeScan == "-1") {
          return;
        }

        final ScanModel scan = await scanListProvider.saveScan(barCodeScan);

        redirect(context, scan);

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
