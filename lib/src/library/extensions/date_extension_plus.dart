// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// extension DateExtensionX on DateTime {
//   String mesAbreviado() {
//     if (this == null) return '-';

//     switch (this.month) {
//       case 1:
//         return 'JAN';
//       case 2:
//         return 'FEV';
//       case 3:
//         return 'MAR';
//       case 4:
//         return 'ABR';
//       case 5:
//         return 'MAI';
//       case 6:
//         return 'JUN';
//       case 7:
//         return 'JUL';
//       case 8:
//         return 'AGO';
//       case 9:
//         return 'SET';
//       case 10:
//         return 'OUT';
//       case 11:
//         return 'NOV';
//       case 12:
//         return 'DEZ';
//       default:
//         return 'Número inválido!';
//     }
//   }

//   String diaDaSemana() {
//     if (this == null) {
//       return '';
//     }
//     if (this.weekday == 1) return 'SEG ';
//     if (this.weekday == 2) return 'TER ';
//     if (this.weekday == 3) return 'QUA ';
//     if (this.weekday == 4) return 'QUI ';
//     if (this.weekday == 5) return 'SEX ';
//     if (this.weekday == 6) return 'SAB ';
//     if (this.weekday == 7) return 'DOM ';
//   }

//   String horaMinuto() {
//     if (this == null) {
//       return '';
//     }
//     return this.dateToString(format: 'HH:mm');
//   }

//   String dateToString({@required String format}) {
//     if (this == null) {
//       return null;
//     }
//     return DateFormat(format).format(this);
//   }

//   int daysOfMonth() {
//     DateTime beginningNextMonth = (this.month < 12)
//         ? new DateTime(this.year, this.month + 1, 1)
//         : new DateTime(this.year + 1, 1, 1);
//     return beginningNextMonth.subtract(new Duration(days: 1)).day;
//   }

//   bool isToday() {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final dateCheck = DateTime(this.year, this.month, this.day);
//     return today == dateCheck;
//   }

//   String get getMonthName {
//     switch (this.month) {
//       case 1:
//         return 'Janeiro';
//       case 2:
//         return 'Fevereiro';
//       case 3:
//         return 'Março';
//       case 4:
//         return 'Abril';
//       case 5:
//         return 'Maio';
//       case 6:
//         return 'Junho';
//       case 7:
//         return 'Julho';
//       case 8:
//         return 'Agosto';
//       case 9:
//         return 'Setembro';
//       case 10:
//         return 'Outubro';
//       case 11:
//         return 'Novembro';
//       case 12:
//         return 'Dezembro';
//       default:
//         return 'Número inválido!';
//     }
//   }
// }
