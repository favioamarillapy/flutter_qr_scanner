import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    final scanList = scanListProvider.scanList;

    return ListView.builder(
      itemCount: scanList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: Text(scanList[index].value),
        subtitle: Text(scanList[index].id.toString()),
        trailing: Icon(Icons.keyboard_arrow_right,
            color: Theme.of(context).primaryColor),
        onTap: () => {print("onTap")},
      ),
    );
  }
}
