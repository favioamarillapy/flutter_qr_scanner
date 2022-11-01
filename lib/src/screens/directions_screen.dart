import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/widgets/custom_dismissible.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';

class DirectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    final scanList = scanListProvider.scanList;

    return CustomDismissible(type: "http");
  }
}
