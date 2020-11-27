import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class TextFieldPlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'TextFieldPlus Example',
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
            _buildExample1(),
            _buildExample2(),
            _buildExample3(),
          ],
        ),
      ),
    );
  }

  Widget _buildExample1() {
    return TextFieldPlus(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      backgroundColor: Colors.black12,
      cursorColor: Colors.red,
      enabled: true,
      textInputType: TextInputType.emailAddress,
      placeholder: TextPlus(
        'E-mail',
        color: Colors.black38,
      ),
      prefixWidget: Icon(
        Icons.alternate_email,
        color: Colors.redAccent,
      ),
      suffixWidget: Icon(
        Icons.email,
        color: Colors.redAccent,
      ),
    );
  }

  Widget _buildExample2() {
    return TextFieldPlus(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      backgroundColor: Colors.black12,
      cursorColor: Colors.red,
      textInputType: TextInputType.number,
      mask: '###.###.###-##',
      placeholder: TextPlus(
        'CPF',
        color: Colors.black38,
      ),
    );
  }

  Widget _buildExample3() {
    return TextFieldPlus(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      cursorColor: Colors.white,
      textCapitalization: TextCapitalization.words,
      maxLines: 1,
      letterSpacing: 2,
      gradient: GradientPlus.linear(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
        ],
      ),
      radius: RadiusPlus.all(12),
      placeholder: TextPlus(
        'Name',
        color: Colors.white70,
      ),
      suffixWidget: Icon(
        Icons.person,
        color: Colors.white70,
      ),
      textColor: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }
}
