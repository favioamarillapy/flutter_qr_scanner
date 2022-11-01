import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';
import 'package:flutter_qr_scanner/src/providers/db_provider.dart';
import 'package:flutter_qr_scanner/src/providers/ui_provider.dart';
import 'package:flutter_qr_scanner/src/screens/directions_screen.dart';
import 'package:flutter_qr_scanner/src/screens/screens.dart';
import 'package:flutter_qr_scanner/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text("History"), actions: [
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            final scanListProvider =
                Provider.of<ScanListProvider>(context, listen: false);
            scanListProvider.deleteAll();
          },
        )
      ]),
      body: _HomeBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenu;

    DBProvider.db.database;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.getScanByType("geo");
        return MapsScreen();
      case 1:
        scanListProvider.getScanByType("http");
        return DirectionsScreen();
      default:
        return MapsScreen();
    }
  }
}
