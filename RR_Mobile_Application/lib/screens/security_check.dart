// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:barcode_widget/barcode_widget.dart';
//
// class SecurityCheckPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SecurityCheckScreen();
//   }
// }
//
// class SecurityCheckScreen extends StatefulWidget {
//   @override
//   _SecurityCheckScreenState createState() => _SecurityCheckScreenState();
// }
//
// class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
//   String scannedData = '';
//   List<ProductInfo> products = [];
//   double totalPrice = 0.0;
//
//   final pastelPurple = Color(0xFFB19CD9);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Security Check'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             if (scannedData.isEmpty)
//               ElevatedButton(
//                 onPressed: scanQr,
//                 style: ElevatedButton.styleFrom(
//                   primary: pastelPurple,
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 child: Text('Scan QR Code'),
//               ),
//             SizedBox(height: 20),
//             if (products.isNotEmpty)
//               Column(
//                 children: [
//                   Text(
//                     'Product List:',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   for (var product in products)
//                     ListTile(
//                       title: Text('Product: ${product.name}'),
//                       subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
//                     ),
//                   Text(
//                     'Total Price: \$${totalPrice.toStringAsFixed(2)}',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> scanQr() async {
//     try {
//       final scannedValue = await FlutterBarcodeScanner.scanBarcode(
//         '#2A99CF',
//         'Cancel',
//         true,
//         ScanMode.QR,
//       );
//
//       if (scannedValue.isNotEmpty) {
//         // Fetch and display product information
//         fetchApiData(scannedValue);
//       }
//     } catch (e) {
//       // Handle QR scan error
//     }
//   }
//
//   Future<void> fetchApiData(String scannedValue) async {
//     final apiUrl = 'https://gomall.techfestsliet.org/api/getbill/$scannedValue';
//
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//
//       if (jsonData['iserror'] == false) {
//         final billData = jsonData['bill'];
//         final productsData = billData['products'];
//
//         for (var productData in productsData) {
//           final product = ProductInfo(
//             name: productData['name'],
//             price: productData['price'].toDouble(),
//           );
//           products.add(product);
//           totalPrice += product.price;
//         }
//
//         setState(() {
//           scannedData = scannedValue;
//         });
//       }
//     }
//   }
// }
//
// class ProductInfo {
//   final String name;
//   final double price;
//
//   ProductInfo({
//     required this.name,
//     required this.price,
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:barcode_widget/barcode_widget.dart';

class SecurityCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecurityCheckScreen();
  }
}

class SecurityCheckScreen extends StatefulWidget {
  @override
  _SecurityCheckScreenState createState() => _SecurityCheckScreenState();
}

class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
  String scannedData = '';
  List<ProductInfo> products = [];
  double totalPrice = 0.0;

  final pastelPurple = Color(0xFFB19CD9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (scannedData.isEmpty)
              ElevatedButton(
                onPressed: scanQr,
                style: ElevatedButton.styleFrom(
                  primary: pastelPurple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code, size: 30, color: Colors.white), // QR code icon
                    SizedBox(width: 10),
                    Text('Scan QR Code', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            SizedBox(height: 20),
            if (products.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Product List:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  for (var product in products)
                    ListTile(
                      title: Text(
                        'Product: ${product.name}',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Price: \$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  Text(
                    'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      final scannedValue = await FlutterBarcodeScanner.scanBarcode(
        '#2A99CF',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (scannedValue.isNotEmpty) {
        // Fetch and display product information
        fetchApiData(scannedValue);
      }
    } catch (e) {
      // Handle QR scan error
    }
  }

  Future<void> fetchApiData(String scannedValue) async {
    final apiUrl = 'https://gomall.techfestsliet.org/api/getbill/$scannedValue';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData['iserror'] == false) {
        final billData = jsonData['bill'];
        final productsData = billData['products'];

        for (var productData in productsData) {
          final product = ProductInfo(
            name: productData['name'],
            price: productData['price'].toDouble(),
          );
          products.add(product);
          totalPrice += product.price;
        }

        setState(() {
          scannedData = scannedValue;
        });
      }
    }
  }
}

class ProductInfo {
  final String name;
  final double price;

  ProductInfo({
    required this.name,
    required this.price,
  });
}

