import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class RichTextPlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'RichTextPlus Example',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildExample() {
    return RichTextPlus(
      texts: [
        TextPlus(
          'Flutter ',
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 30,
        ),
        TextPlus(
          'Plus ',
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        TextPlus(
          '!',
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        TextPlus(
          '!',
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        TextPlus(
          '!',
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ],
    );
  }
}
