import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/src/widgets/custom_dismissible.dart';

class DirectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDismissible(type: "http");
  }
}
