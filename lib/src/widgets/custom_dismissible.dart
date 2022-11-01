import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/utils/utils.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';

class CustomDismissible extends StatelessWidget {
  final String type;

  const CustomDismissible({required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context);
    final scanList = scanListProvider.scanList;

    return ListView.builder(
      itemCount: scanList.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scanList[index].id!);
        },
        child: ListTile(
          leading: Icon(
              type == "http" ? Icons.home_outlined : Icons.map_outlined,
              color: Theme.of(context).primaryColor),
          title: Text(scanList[index].value),
          subtitle: Text(scanList[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Theme.of(context).primaryColor),
          onTap: () => redirect(context, scanList[index]),
        ),
      ),
    );
  }
}
