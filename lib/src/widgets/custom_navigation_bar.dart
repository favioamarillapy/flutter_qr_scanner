import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/providers/ui_providers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenu;

    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenu = value,
      elevation: 0,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: "Directions")
      ],
    );
  }
}
