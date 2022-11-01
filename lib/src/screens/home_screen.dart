import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(
          elevation: 0,
          title: Text("History"),
          actions: [Icon(Icons.delete_forever)]),
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

    switch (currentIndex) {
      case 0:
        return MapsScreen();
      case 1:
        return DirectionsScreen();
      default:
        return MapsScreen();
    }
  }
}
