import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/src/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_scanner/src/providers/ui_provider.dart';
import 'package:flutter_qr_scanner/src/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => new ScanListProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "QR Scanner",
        initialRoute: 'home',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        routes: {
          'home': ((context) => HomeScreen()),
          'map': ((context) => MapScreen()),
        },
      ),
    );
  }
}
