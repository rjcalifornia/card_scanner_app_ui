import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'dart:typed_data';

void main() {
  runApp(ScannerApp());
}

class ScannerApp extends StatefulWidget {
  @override
  _ScannerAppState createState() => _ScannerAppState();
}

class _ScannerAppState extends State<ScannerApp> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easy Scanner App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.memory(bytes),
              ),
              Text('Result of reading QR:  $barcode'),
              RaisedButton(
                  onPressed: _scanFromCamera,
                  child: Text("Scan QR Code")),
              SizedBox(
                height: 128,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _scanFromCamera() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);

    print(barcode);
  }
}
