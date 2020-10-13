// import 'dart:math';

// extension NumExtensionX on num {
//   String numberToCurrency({bool exibeMoeda}) {
//     if (exibeMoeda == false)
//       return NumberFormat.XCurrency(name: '').format(this).trim();
//     else
//       return NumberFormat.XCurrency().format(this).trim();
//   }

//   get numberFormat {
//     return NumberFormat.decimalPattern().format(this);
//   }

//   String format() {
//     return this.toStringAsFixed(this.truncateToDouble() == this ? 0 : 2);
//   }

//   num roundDecimals({num decimals = 2}) {
//     int fac = pow(10, decimals);
//     double d = this;
//     d = (d * fac).round() / fac;
//     return d;
//   }
// }
