import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('QR Code Generator'),
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Container(
          color: Colors.transparent, // Set the background color here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: _controller.text.isNotEmpty ? _controller.text : "Empty data",
                size: 200,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40),
              buildTextField(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildTextField() => TextField(
    controller: _controller,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Enter the data',
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
        ),
      ),
      suffixIcon: IconButton(
        color: Theme.of(context).accentColor,
        icon: Icon(Icons.done, size: 30),
        onPressed: () => setState(() {}),
      ),
    ),
  );
}
