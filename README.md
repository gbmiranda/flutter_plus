> #### 🌐 _Languages: EN_ - [PT](README_PT.md)

[![likes](https://badges.bar/flutter_plus/likes)](https://pub.dev/packages/flutter_plus/likes)
[![popularity](https://badges.bar/flutter_plus/popularity)](https://pub.dev/packages/flutter_plus/popularity)
[![pub points](https://badges.bar/flutter_plus/pub%20points)](https://pub.dev/packages/flutter_plus/points) 

# 🗂 Index

- [FlutterPlus](#-flutterplus)
- [Installation](#-installation)
- [Examples](#-examples)
	- [Demonstration](#-demonstration)
	- [Widgets](#-widgets)
		- [ContainerPlus](#-containerplus)
		- [ButtonPlus](#-buttonplus)
		- [TextFieldPlus](#-textfieldplus)
		- [TextPlus](#-textplus)
		- [RichTextPlus](#-richtextplus)
	- [Utils](#-utils)
		- [NavigatorPlus](#-navigatorplus)
		- [BottomSheetPlus](#-bottomsheetplus)
		- [DialogPlus](#-dialogplus)
		- [SnackBarPlus](#-snackbarplus)
		- [LocalStoragePlus](#-localstorageplus)
		- [UtilsPlus](#-utilsplus)
	- [Extensions](#-extensions)
		- [StringExtensionPlus](#-stringextensionplus)
		- [DateExtensionPlus](#-dateextensionplus)
		- [NumExtensionPlus](#-numextensionplus)
		- [FileExtensionPlus](#-fileextensionplus)
		- [DurationExtensionPlus](#-durationextensionplus)
	- [Attributes](#-attributes)
		- [BorderPlus](#-borderplus)
		- [GradientPlus](#-gradientplus)
		- [InnerShadowPlus](#-innershadowplus)
		- [RadiusPlus](#-radiusplus)
		- [ShadowPlus](#-shadowplus)
		- [SkeletonPlus](#-skeletonplus)
		- [TextDecorationPlus](#-textdecorationplus)
- [Next steps](#-next-steps)

# 👾 FlutterPlus

### Creating apps using Flutter is great, but it can get better!

FlutterPlus is an open-source library created to make Flutter development faster, easier and more intuitive.

Create **Containers**, **Buttons**, **TextFields**, **Texts** and **RichTexts** customized with few lines.

Navigate between **Telas**, open **BottomSheets**, **Dialogs** and **Snackbars** without context anywhere in your code.

Use extensions to treat **datas**, **strings**, **números** and **arquivos**.

> ** Many of the solutions found here were created for my own use throughout my journey with Flutter.

> I decided to bring everything together in a single place to help my work and that of anyone interested ;)**

> I will always try to keep the documentation up to date but it may happen that I forget to put something or other here ;)

# 🔩 Installation

Add the <b>flutter_plus</b> dependency to your project's <b>pubspec.yaml</b> file.

```yaml
dependencies:
  flutter_plus: any
```

Import a single file to access all components.

```dart
import 'package:flutter_plus/plus.dart';
```

> **- This library will always be in constant evolution, so:**
> 
> 1- If you don't want to have problems with names or attributes changing and stopping, I suggest setting the version when you start using it.
> 
> 2- If you're like me who likes evolution and don't mind a little rework when it is for the best, leave it without a fixed version and stay tuned for updates ;) 

_*No extra adjustments are required to work on iOS, Android, Web or Desktop._

# 📚 Examples

The following are examples of how to use and configure the main features of the library.

_*You can also find an example project showing how to use the library [here](https://github.com/gbmiranda/flutter_plus/tree/master/example)._

## 🍬 Demonstration

An appetizer of the real meaning of the library. Two codes that do the same thing, the first with native widgets and the second using the library.

> A customized Container with centralized text that accepts user interaction.
> 
![FlutterPlus compare](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/comparativo.png)

## 🛠 Widgets

The *Widgets* below are evolutions of the native Flutter. They were created to increase productivity and facilitate customization, with more powerful and intuitive attributes.

> **Create more complex widgets with less code.**

### `📌 ContainerPlus`

For me, the *Container* widget is the basis of Flutter. Our **ContainerPlus** is an evolution of the native, easier to customize and with several properties.

> **Example 1:**

```dart
ContainerPlus(
  width: 150,
  height: 150,
  radius: RadiusPlus.all(20),
  color: Colors.yellow,
  shadows: [
    ShadowPlus(
      color: Colors.red,
      moveDown: -10,
      moveRight: -10,
      blur: 5,
      spread: 1,
      opacity: 0.2,
    ),
    ShadowPlus(
      color: Colors.blue,
      moveDown: 10,
      moveRight: 10,
      blur: 10,
      spread: 5,
      opacity: 0.5,
    ),
  ],
  border: BorderPlus(
    color: Colors.black,
    width: 2,
  ),
  child: TextPlus(
    'EXAMPLE 1',
    isCenter: true,
    color: Colors.white,
  ),
);
```

![ContainerPlus example_1](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/container_plus_1.png)

> **Example 2:**

```dart
ContainerPlus(
  margin: EdgeInsets.only(top: 48),
  width: 150,
  height: 150,
  isCircle: true,
  gradient: GradientPlus.linear(
    colors: [
      Colors.yellow,
      Colors.orange,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
  ),
  innerShadows: [
    InnerShadowPlus(
      color: Colors.green,
      blur: 10,
    )
  ],
  child: TextPlus(
    'EXAMPLE 2',
    isCenter: true,
    color: Colors.white,
  ),
);
```

![ContainerPlus example_2](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/container_plus_2.png)

> **Example 3:**

```dart
bool isLoading = false;

ContainerPlus(
  margin: EdgeInsets.only(top: 48),
  width: 150,
  height: 150,
  color: Colors.black,
  radius: RadiusPlus.only(topLeft: 40, bottomRight: 10),
  skeleton: SkeletonPlus.automatic(enabled: this.isLoading),
  onTap: () {
    setState(() {
      this.isLoading = !this.isLoading;
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        this.isLoading = !this.isLoading;
      });
    });
  },
  child: TextPlus(
    'EXAMPLE 3',
    isCenter: true,
    color: Colors.white,
  ),
);
```

![ContainerPlus example_3](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/container_plus_3.gif)

### `📌 ButtonPlus`

> **Example 1:**

```dart
ButtonPlus(
  width: 200,
  height: 60,
  radius: RadiusPlus.all(12),
  color: Colors.blue,
  enabled: true,
  splashColor: Colors.red,
  highlightColor: Colors.yellow,
  focusColor: Colors.green,
  hoverColor: Colors.pink,
  child: TextPlus(
    'EXAMPLE 1',
    color: Colors.white,
  ),
  onPressed: () {
    print('EXAMPLE 1');
  },
);
```

![ButtonPlus example_1](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/button_plus_1.png)

> **Example 2:**

```dart
ButtonPlus(
  margin: EdgeInsets.only(top: 48),
  width: 200,
  height: 60,
  radius: RadiusPlus.bottom(20),
  color: Colors.yellow,
  shadows: [
    ShadowPlus(
      color: Colors.red,
      moveDown: -10,
      moveRight: -10,
      blur: 5,
      spread: 1,
      opacity: 0.2,
    ),
    ShadowPlus(
      color: Colors.blue,
      moveDown: 10,
      moveRight: 10,
      blur: 10,
      spread: 5,
      opacity: 0.5,
    ),
  ],
  border: BorderPlus(
    color: Colors.black,
    width: 2,
  ),
  child: TextPlus(
    'EXAMPLE 2',
    color: Colors.white,
  ),
  onPressed: () {
    print('EXAMPLE 2');
  },
);
```

![ButtonPlus example_2](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/button_plus_2.png)

> **Example 3:**

```dart
ButtonPlus(
  margin: EdgeInsets.only(top: 48),
  width: 200,
  height: 60,
  isCircle: true,
  gradient: GradientPlus.linear(
    colors: [
      Colors.yellow,
      Colors.orange,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
  ),
  innerShadows: [
    InnerShadowPlus(
      color: Colors.green,
      blur: 10,
    )
  ],
  child: TextPlus(
    'EXAMPLE 3',
    color: Colors.white,
  ),
  onPressed: () {
    print('EXAMPLE 3');
  },
);
```

![ButtonPlus example_3](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/button_plus_3.png)

> **Example 4:**

```dart
bool isLoading = false;

ButtonPlus(
  margin: EdgeInsets.only(top: 48),
  width: 200,
  height: 60,
  color: Colors.black,
  radius: RadiusPlus.only(topLeft: 40, bottomRight: 10),
  skeleton: SkeletonPlus.automatic(enabled: this.isLoading),
  child: TextPlus(
    'EXAMPLE 4',
    color: Colors.white,
  ),
  onPressed: () {
    print('EXAMPLE 4');

    setState(() {
      this.isLoading = !this.isLoading;
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        this.isLoading = !this.isLoading;
      });
    });
  },
);
```
![ButtonPlus example_4](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/button_plus_4.gif)

### `📌 TextFieldPlus`

> **Example 1:**

```dart
TextFieldPlus(
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
```

![TextFieldPlus example_1](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_field_plus_1.png)

> **Example 2:**

```dart
TextFieldPlus(
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
```

![TextFieldPlus example_2](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_field_plus_2.png)

> **Example 3:**

```dart
TextFieldPlus(
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
```

![TextFieldPlus example_3](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_field_plus_3.png)

### `📌 TextPlus`

> **Example 1:**

```dart
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
```

![TextPlus example_1](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_plus_1.png)

> **Example 2:**

```dart
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
```

![TextPlus example_2](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_plus_2.png)

> **Example 3:**

```dart
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
```
![TextPlus example_3](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/text_plus_3.png)

### `📌 RichTextPlus`

```dart
RichTextPlus(
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
```
![RichTextPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/rich_text_plus.png)

## 🔧 Utils

In addition to the standard widgets we have some abstractions that will save you code and time so you can focus on what really matters to your project.

### `📌 NavigatorPlus`

NavigatorPlus makes it possible to navigate between screens from anywhere in your code, without the need for a `context`.

> You need to configure it to work.

**• Navigate to the next screen:**

```dart
// Navigate to desired screen
navigatorPlus.show(NextScreen());
```

```dart
// Open desired screen as modal
navigatorPlus.showModal(NextScreen());
```

**• Back or close screen:**

```dart
// Back or close to previous screen
navigatorPlus.back();
```

```dart
// Check if there is a previous screen to go back
if (navigatorPlus.canBack) {
  navigatorPlus.back();
}
```

```dart
// Back to first stack screen
navigatorPlus.backAll();
```

**• Return data to source screen:**

```dart
// Call the next screen with await waiting for a return
var result = await navigatorPlus.show(NextScreen());

// Return to the previous screen passing the desired data
navigatorPlus.back(result: customData);
```

**• Configuration:**

> Recommended: Replace MaterialApp with FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternative: Add the keys of the navigatorPlus and snackBarPlus.

```dart
MaterialApp(
  title: 'Flutter Plus Example',
  navigatorKey: navigatorPlus.key,
  builder: (context, child) {
    return Scaffold(
      key: snackBarPlus.scaffoldKey,
      body: child,
    );
  },
);
```

**• Context:**

```dart
// Get current context
BuildContext context = navigatorPlus.currentContext;
```

**• Access:**

```dart
navigatorPlus.show(NextScreen());

FlutterPlus.navigator.show(NextScreen());
```

### `📌 BottomSheetPlus`

O BottomSheetPlus possibilita a abertura em qualquer lugar do seu código, sem a necessidade de um `context`.

> You need to configure it to work.

```dart
bottomSheetPlus.show(
  child: CustomWidget(),
  radius: RadiusPlus.top(20),
  heightPercentScreen: 0.3,
);
```
![BottomSheetPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/bottom_sheet_plus.png)

**• Access:**

```dart
bottomSheetPlus.show(...);

FlutterPlus.bottomSheet.show(...);
```

**• Configuration:**

> Recommended: Replace MaterialApp with FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternative: Add the keys of the navigatorPlus and snackBarPlus.

```dart
MaterialApp(
  title: 'Flutter Plus Example',
  navigatorKey: navigatorPlus.key,
  builder: (context, child) {
    return Scaffold(
      key: snackBarPlus.scaffoldKey,
      body: child,
    );
  },
);
```

### `📌 DialogPlus`

DialogPlus makes it possible to open a dialog with an already defined layout.

> You need to configure it to work.

```dart
// Opening of customizable default Dialog

const url = 'https://github.com/gbmiranda/flutter_plus';

dialogPlus.showDefault(
	title: 'FlutterPlus',
	message: url,
	elementsSpacing: 16,
	buttonOneText: 'Close',
	buttonOneColor: Colors.red,
	buttonOneCallback: () {
	  navigatorPlus.back();
	},
	buttonTwoText: 'Open',
	buttonTwoCallback: () async {
	  if (await canLaunch(url)) {
	    await launch(url);
	  } else {
	    throw 'Could not launch $url';
	  }
	},
);
```
![DialogPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/dialog_plus_default.png)

```dart
// Dialog opening with its own layout

  dialogPlus.show(
    child: CustomWidget(),
    radius: RadiusPlus.all(20),
    closeKeyboardWhenOpen: true,
  );
```

![DialogPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/dialog_plus_custom.png)

**• Access:**

```dart
dialogPlus.show(...);

FlutterPlus.dialog.show(...);
```

**• Configuration:**

> Recommended: Replace MaterialApp with FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternative: Add the keys of the navigatorPlus and snackBarPlus.

```dart
MaterialApp(
  title: 'Flutter Plus Example',
  navigatorKey: navigatorPlus.key,
  builder: (context, child) {
    return Scaffold(
      key: snackBarPlus.scaffoldKey,
      body: child,
    );
  },
);
```

### `📌 SnackBarPlus`

SnackBarPlus allows you to open your code anywhere, without the need for a scaffold.

> You need to configure it to work.

```dart
// SnackBar opening with plain text

snackBarPlus.showText(
  'FlutterPlus',
  textColor: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  backgroundColor: Colors.green,
);
```

![SnackBarPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/snack_bar_plus_default.png)

```dart
// SnackBar opening with custom widget

snackBarPlus.show(
	backgroundColor: Colors.green,
	child: Row(
	  mainAxisAlignment: MainAxisAlignment.center,
	  children: [
	    Icon(
	      Icons.star,
	      color: Colors.yellow,
	    ),
	    SizedBox(
	      width: 8,
	    ),
	    TextPlus(
	      'FlutterPlus!',
	      color: Colors.white,
	      fontSize: 18,
	      fontWeight: FontWeight.bold,
	    ),
	    SizedBox(
	      width: 8,
	    ),
	    Icon(
	      Icons.star,
	      color: Colors.yellow,
	    ),
	  ],
	),
);
```
![SnackBarPlus example](https://raw.githubusercontent.com/gbmiranda/flutter_plus/master/example/images/snack_bar_plus_custom.png)

**• Configuration:**

> Recommended: Replace MaterialApp with FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternative: Add the keys of the navigatorPlus and snackBarPlus.

```dart
MaterialApp(
  title: 'Flutter Plus Example',
  navigatorKey: navigatorPlus.key,
  builder: (context, child) {
    return Scaffold(
      key: snackBarPlus.scaffoldKey,
      body: child,
    );
  },
);
```

**• Access:**

```dart
snackBarPlus.show(...);

FlutterPlus.snackBar.show(...);
```

### `📌 LocalStoragePlus`

LocalStoragePlus makes it possible to persist and access local data anywhere in your code.

```dart
// Save local data
await localStoragePlus.write('lib_name', 'flutter_plus');

// Read local data
await localStoragePlus.read('lib_name');

// Erase local data
await localStoragePlus.delete('lib_name');

// Check for local data
await localStoragePlus.containsKey('lib_name');

// Clear all local data
await localStoragePlus.clear();
```

**• Access:**

```dart
localStoragePlus...;

FlutterPlus.localStorage...;
```

> Uses the `shared_preferences` dependency.

### `📌 UtilsPlus`

UtilsPlus provides functions to assist in the development of your application.

```dart
// Close the keyboard if it is open
utilsPlus.closeKeyboard();

// Get a Color from a Hex
Color customColor = utilsPlus.colorHex('FFFFFF');
```

**• Access:**

```dart
utilsPlus...;

FlutterPlus.utils...;
```

## 🧩 ExtensionsPlus

Last but not least, *** Extensions *** are a powerful tool to make certain tasks easier without having to replicate code multiple times.

In this section you will find various extensions for the types ***String***, ***Date***, ***Num***, ***File***, ***Duration***.

> Sometimes it is difficult to keep everything up to date, so new properties may appear that are not here.

### `📌 StringExtensionPlus`

**• Properties:**

| Property | Example | Result |
| ---| --- | --- |
| toDate | `"11/08/1992".toDate(format: "dd/MM/yyyy");` | DateTime
| capitalizeFirstWord | `"flutter plus".capitalizeFirstWord;` | Flutter plus
| capitalizeAllWords | `"flutter plus".capitalizeAllWords;` | Flutter Plus
| setMask | `"00000000000".setMask(mask: "###.###.###-##");` | 000.000.000-00
| cleanDiacritics ou removerAcentos | `"fluttér plús". cleanDiacritics;` | flutter plus
| firstLetter | `"flutter plus".firstLetter;` | f
| firstWord | `"flutter plus".firstWord;` | flutter
| toBase64 | `"flutter plus".toBase64;` | base64Str
| fromBase64 | `base64Str.fromBase64;` | flutter plus
| cleanString | `"* flutter plus *".cleanString;` | flutter plus
| cleanStringAndSpaces | `"* flutter plus *".cleanStringAndSpaces;` | flutterplus
| isNotNullOrEmpty | `"flutter plus".isNotNullOrEmpty;` | true
| isEmail | `"flutter plus".isEmail;` | false
| isNum | `"flutter plus".isNum;` | false
| isBool | `"flutter plus".isBool;` | false
| isDateTime | `"flutter plus".isDateTime;` | false
| isURL | `"flutter plus".isURL;` | false
| isCpf | `"flutter plus".isCpf;` | false
| isCelular | `"flutter plus".isCelular;` | false
| isTelefone | `"flutter plus".isTelefone;` | false

**• Example:**

```dart
String dateStr = "01/01/2020 10:00:00";
DateTime date = dateStr.toDate("dd/MM/yyyy");
print(date.year); 
// 2020
```

### `📌 DateExtensionPlus`

**• Properties:**

| Property | Return Type | Result |
| ---| --- | --- |
| format | `String` | String with formatted date
| daysOfMonth | `int` | Number of days of the month
| daysOfYear | `int` | Number of days in the year (366 when binary year)
| isToday | `bool` | True or false
| monthName | `String` | Month name
| monthNameSort | `String` | Summarized month name
| weekName | `String` | Day of the week
| weekNameSort | `String` | Summary day of the week

**• Example:**

```dart
DateTime.now date = DateTime.now();
String dateStr = date.format("dd/MM/yyyy");
print(dateStr); 
// 01/01/2020
```

### `📌 NumExtensionPlus`

**• Properties:**

| Property | Return Type | Result |
| ---| --- | --- |
| toCurrency | `String` | Formats to local currency
| toCurrencyCompact | `String` | Formats to summarized local currency
| toPrecision | `double` | Sets number of decimal places
| daysToHours | `int` | Days to hours
| minutesToHours | `int` | Minutes to hours
| secondsToHours | `int` | Seconds to hours
| hoursToDays | `int` | Hours to days
| secondsToMinutes | `int` | Seconds to minutes
| hoursToMinutes | `int` | Hours to minutes
| isNullOrZero | `bool` | Checks if it is different from null or zero

**• Example:**

```dart
double value = 13512.98;
print(value.toCurrency()); 
// $ 13,512.98
// R$ 13.512,98
```

### `📌 FileExtensionPlus`

**• Properties:**

| Property | Return Type | Result |
| ---| --- | --- |
| base64Sync | `String` | Converts to base64 sync
| base64Async | `String` | Converts to base64 async

**• Example:**

```dart
File customFile = File(path);
String base64 = customFile.base64Sync;
```

### `📌 DurationExtensionPlus`

**• Properties:**

| Property | Return Type | Result |
| ---| --- | --- |
| months | `int` | Returns the number of months of Duration
| days | `int` | Returns the number of days of Duration
| hours | `int` | Returns the number of hours of Duration
| hoursStr | `String` | Returns the formatted number of hours of Duration
| minutes | `int` | Returns the number of minutes of Duration
| minutesStr | `String` | Returns the formatted number of minutes of Duration
| seconds | `int` | Returns the number of seconds of Duration
| secondsStr | `String` | Returns the formatted number of seconds of Duration
| formattedDuration | `String` | Returns the formatted Duration

**• Example:**

```dart
Duration customDuration = Duration(hours: 10, minutes: 4, seconds: 55);
print(customDuration.days); // 0
print(customDuration.hours); // 10
print(customDuration.minutesStr); // 04
print(customDuration.formattedDuration); // 10:04:55
```

## ⚙️ Attributes

The customization attributes below are used in most of the widgets above.

### `📌 BorderPlus`

```dart
BorderPlus(
  color: Colors.black,
  style: BorderStyle.solid,
  width: 2.0,
);
```

### `📌 GradientPlus`

```dart
GradientPlus.linear(
  colors: [Colors.black, Colors.white],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0.2, 0.8],
);
```

```dart
GradientPlus.radial(
  colors: [Colors.black, Colors.white],
  center: Alignment.centerLeft,
  focal: Alignment.bottomCenter,
  focalRadius: 1.5,
  radius: 4.5,
  stops: [0.3, 0.7],
);
```

```dart
GradientPlus.sweep(
  colors: [Colors.black, Colors.white],
  center: Alignment.centerLeft,
  startAngle: 1.5,
  endAngle: 3.2,
  stops: [0.5, 0.8],
);
```

### `📌 InnerShadowPlus`

```dart
InnerShadowPlus(
  color: Colors.red,
  blur: 10.0,
  moveDown: 4.5,
  moveRight: 2.5,
  opacity: 0.5,
);
```
### `📌 RadiusPlus`

```dart
RadiusPlus.all(12.0);
```

```dart
RadiusPlus.bottom(12.0);
```

```dart
RadiusPlus.top(12.0);
```

```dart
RadiusPlus.only(
  topLeft: 10.0,
  topRight: 16.0,
  bottomLeft: 4.0,
  bottomRight: 8.0,
);
```

### `📌 ShadowPlus`

```dart
ShadowPlus(
  color: Colors.red,
  blur: 10.0,
  spread: 2.5,
  moveDown: 4.5,
  moveRight: 2.5,
  opacity: 0.5,
);
```

### `📌 SkeletonPlus`

```dart
bool isLoading = true;
SkeletonPlus.automatic(enabled: isLoading);
```

```dart
bool isLoading = true;
SkeletonPlus.custom(
  enabled: isLoading,
  baseColor: Colors.black87,
  highlightColor: Colors.black26,
  duration: Duration(
    milliseconds: 500,
  ),
  showBorders: false,
  showShadows: false,
);
```

### `📌 TextDecorationPlus`

```dart
TextDecorationPlus(
  color: Colors.red,
  decorationStyle: TextDecorationStyle.dashed,
  decorationThickness: 0.5,
);
```

# 🎯 Next Steps

📌 Detailed documentation of the components.

📌 Route Navigation

📌 ScaffoldPlus.

📌 GridViewPlus.

📌 ListViewPlus.

📌 LoadingPlus.

📌 ThemePlus.

📌 TranslatePlus.

📌 ∞
