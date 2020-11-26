import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

class TextPlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'TextPlus Example',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      body: this._buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            this._buildExample1(),
            this._buildExample2(),
            this._buildExample3(),
          ],
        ),
      ),
    );
  }

  _buildExample1() {
    TextPlus(
      'Exemplo 1',
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.red,
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 2,
      wordSpacing: 20,
      maxLines: 1,
      textOverflow: TextOverflow.ellipsis,
    );
  }

  _buildExample2() {
    TextPlus(
      'Exemplo 2',
      color: Colors.white,
      fontSize: 20,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.all(16),
      backgroundGradient: GradientPlus.linear(
        colors: [
          Colors.yellow,
          Colors.orange,
          Colors.pink,
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
      backgroundRadius: RadiusPlus.all(10),
      backgroundBorder: BorderPlus(
        color: Colors.blue,
        width: 2,
      ),
      textShadows: [
        ShadowPlus(
          color: Colors.black45,
          blur: 10,
        )
      ],
    );
  }

  _buildExample3() {
    TextPlus(
      '00000000000',
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.black,
      color: Colors.white,
      fontSize: 20,
      mask: '###.###.###-##',
      onTap: () {
        print('Exemplo 3');
      },
    );
  }
}
