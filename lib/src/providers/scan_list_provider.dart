import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/src/models/scan_model.dart';
import 'package:flutter_qr_scanner/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scanList = [];
  String selectedType = 'http';

  saveScan(String value) async {
    final scan = ScanModel(value: value);
    scan.id = await DBProvider.db.saveScan(scan);

    if (selectedType == scan.type) {
      scanList.add(scan);
      notifyListeners();
    }
  }

  getAll() async {
    final scans = await DBProvider.db.getAll();
    scanList = [...?scans];
    notifyListeners();
  }

  getScanByType(String type) async {
    final scan = await DBProvider.db.getScanByType(type);
    scanList = [...?scan];
    selectedType = type;
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    getScanByType(selectedType);
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scanList = [];
    notifyListeners();
  }
}
