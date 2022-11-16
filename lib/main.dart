import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeRoute(),
      '/second': (context) => const SecondRoute(),
      // '/third': (context) => const ThirdRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg_image.jpg'),
                  opacity: 0.5,
                  fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.white38,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white60,
                  leading: Image.asset('images/jiit_logo.png'),
                  title: Center(
                      child: Text('Welcome to JIIT',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black)))),
              body: Container(
                  child: SafeArea(
                      child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text('Admin Login Page',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                      child: TextField(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        // controller: nameController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          labelText: 'User Name',
                          // errorText: 'Wrong User Name',
                        ),
                      )),
                  Container(
                      // padding: EdgeInsets.fromLTRB(250, 50, 60, 10),
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                      child: TextField(
                          obscureText: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          // controller: nameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white70),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            labelText: 'Password',
                            // errorText: 'Wrong Password',
                          ))),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Center(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Text(
                            'Sign In',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )))
                ],
              ))))),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg_image.jpg'),
              opacity: 0.5,
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white60,
            leading: Image.asset('images/jiit_logo.png'),
            title: Center(
                child: Text('Welcome to JIIT',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black)))),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Text(
                'Scan the QR code using this scanner to start the admission process',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 60),
              child: ElevatedButton(
                  onPressed: () => scanQR(),
                  child: const Text(
                    'QR scan',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 13),
                  )),
            )
          ],
        )),
      ),
    ));
  }
}
