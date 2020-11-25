> #### 🌐 _Idiomas: [EN](README.md) - PT_

<!--[![Powered by Flame](https://img.shields.io/badge/Powered%20by-%F0%9F%94%A5-orange.svg)](https://flame-engine.org)
[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![pub package](https://img.shields.io/pub/v/bonfire.svg)](https://pub.dev/packages/bonfire)
[![buymeacoffee](https://i.imgur.com/aV6DDA7.png)](https://www.buymeacoffee.com/rafaelbarbosa)
-->
# 🗂 Indice

- [FlutterPlus](#-flutterplus)
- [Instalação](#-instalação)
- [Exemplos](#-exemplos)
	- [Widgets](#-widgets)
		- [ContainerPlus](#-containerplus)
		- [ButtonPlus](#-buttonplus)
		- [TextFieldPlus](#-textfieldplus)
		- [TextPlus](#-textplus)
		- [RichTextPlus](#-richtextplus)
	- [Atributos](#-atributos)
		- [BorderPlus](#-borderplus)
		- [GradientPlus](#-gradientplus)
		- [InnerShadowPlus](#-innershadowplus)
		- [RadiusPlus](#-radiusplus)
		- [ShadowPlus](#-shadowplus)
		- [SkeletonPlus](#-skeletonplus)
		- [TextDecorationPlus](#-textdecorationplus)
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
- [Próximos Passos](#-próximos-passos)

# 👾 FlutterPlus

### Criar aplicativos utilizando Flutter é ótimo, mas pode ficar melhor!

FlutterPlus é uma biblioteca open-source criada para tornar o desenvolvimento em Flutter mais rápido, fácil e intuitivo.

Crie **Containers**, **Buttons**, **TextFields**, **Texts** e **RichTexts** customizados com poucas linhas.

Navegue entre **Telas**, abra **BottomSheets**, **Dialogs** e **Snackbars** sem contexto de qualquer lugar do seu código.

Utilize extensões para tratar **datas**, **strings**, **números** e **arquivos**.

> **Muitas das soluções encontradas aqui foram criadas para uso próprio ao longo da minha jornada com Flutter.
> Resolvi reunir tudo uma único lugar para auxiliar meu trabalho e o de quem interessar. ;)**

# 🔩 Instalação

Adicione a dependência <b>flutter_plus</b> no arquivo <b>pubspec.yaml</b> do seu projeto.

```yaml
dependencies:
  flutter_plus: any
```

Importe um único arquivo para acessar todos os componentes.

```dart
import 'package:flutter_plus/plus.dart';
```

_*Não é necessário nenhum ajuste extra para funcionar no iOS, Android, Web ou Desktop._

# 📚 Exemplos

A seguir existem exemplos de como usar e configurar os principais recursos da biblioteca.

_*Você também encontra um projeto de exemplo mostrando como utilizar a biblioteca [aqui](https://github.com/gbmiranda/flutter_plus/tree/master/example)._

## 🛠 Widgets

Os *Widgets* abaixo são evoluções dos nativos do Flutter. Foram criados para aumentar a produtividade facilitar a customização, com atributos mais poderosos e intuitivos. 

> Crie Widgets mais complexos com menos código.

### `📌 ContainerPlus`

Para mim o widget *Container* é a base do Flutter. O nosso **ContainerPlus** é uma evolução do nativo, mais fácil de customizar e com diversas propriedades.

**Clique [aqui]() para conhecer todos os atributos do ContainerPlus.*

### `📌 ButtonPlus`

O **ButtonPlus** oferece tudo que o Button nativo e muito mais!

**Clique [aqui]() para conhecer todos os atributos do ButtonPlus.*

### `📌 TextFieldPlus`

O **TextFieldPlus** oferece tudo que o TextField nativo e muito mais!

**Clique [aqui]() para conhecer todos os atributos do TextFieldPlus.*

### `📌 TextPlus`

O **TextPlus** oferece tudo que o Text nativo e muito mais!

> **Exemplo 1:**

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

> **Exemplo 2:**

```dart
TextPlus(
	'Exemplo 2',
	margin: EdgeInsets.only(top: 24),
   	padding: EdgeInsets.all(16),
   	color: Colors.white,
   	fontSize: 20,
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

> **Exemplo 3:**

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

### `📌 RichTextPlus`

O **RichTextPlus** oferece tudo que o RichText nativo e muito mais!

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
## ⚙️ Atributos

### `📌 BorderPlus`

### `📌 GradientPlus`

### `📌 InnerShadowPlus`

### `📌 RadiusPlus`

### `📌 ShadowPlus`

### `📌 SkeletonPlus`

### `📌 TextDecorationPlus`

### `📌 SkeletonPlus`


## 🔧 Utils

Contribution is not limited to software developers, since there are other ways you can help. For example, contributing towards documentation, translation and support. Join the room on Gitter to see how you can help (see below).

### `📌 NavigatorPlus`

O NavigatorPlus possibilita a navegação entre telas de qualquer lugar do seu código, sem a necessidade de um `context`.

**• Navegar para próxima tela:**

```dart
// Navegar para tela desejada.
navigatorPlus.show(NextScreen());
```

```dart
// Abrir tela desejada como modal.
navigatorPlus.showModal(NextScreen());
```

**• Voltar tela:**

```dart
// Voltar para tela anterior.
navigatorPlus.back();
```

```dart
// Verificar se existe tela anterior para voltar.
if (navigatorPlus.canBack) {
	navigatorPlus.back();
}
```

```dart
// Voltar para primeira tela da pilha.
navigatorPlus.backAll();
```

**• Retornar dados para tela de origem:**

```dart
// Chamar a próxima tela com await esperando um retorno.
var result = await navigatorPlus.show(NextScreen());

// Voltar para tela anterior passando os dados desejados.
navigatorPlus.back(result: customData);
```

**• Configuração:**

```dart
// Opção 1 -> inserir a key direto no seu MaterialApp.
return MaterialApp(
...
navigatorKey: navigatorPlus.key,
...
);
```

```dart
// Opção 2 -> Substituir o MaterialApp pelo FlutterAppPlus.
return FlutterAppPlus(
...
);
```

**• Context:**

```dart
// Pegar context atual.
BuildContext context = navigatorPlus.currentContext;
```

**• Acesso:**

```dart
// Formas de acessar.
navigatorPlus.show(NextScreen());
FlutterPlus.navigator.show(NextScreen());
```

### `📌 BottomSheetPlus`

O BottomSheetPlus possibilita a abertura em qualquer lugar do seu código, sem a necessidade de um `context`.

> Necessita configurar o NavigatorPlus para funcionar.

```dart
bottomSheetPlus.show(child: YourBottomSheet());
```

**• Atributos Plus:**

| Atributo | Tipo | Função |
| --- | --- | --- |
| heightPercentScreen | `double` | Utilizar uma porcentagem da tela de 0.0 a 1.0 (100%). |
| height | `double` | Utilizar uma altura exata da tela. |
| onClosed | `Function(dynamic result)` | Capturar valor retornado pelo BottomSheet ao fechar. |
| radius | `RadiusPlus`  | Arredondar as bordas do BottomSheet. |
| border | `BorderPlus`  | Criar uma borda em torno do BottomSheet. |

**• Acesso:**

```dart
// Formas de acessar.
bottomSheetPlus.show(...);
FlutterPlus.bottomSheet.show(...);
```

### `📌 DialogPlus`

Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et.

> Necessita configurar o NavigatorPlus para funcionar.

**• Acesso:**

```dart
// Formas de acessar.
dialogPlus.show(...);
FlutterPlus.dialog.show(...);
```

### `📌 SnackBarPlus`

O SnackBarPlus possibilita a abertura em qualquer lugar do seu código, sem a necessidade de um `scaffold`.

```dart
// Abertura de SnackBar com texto simples. 
snackBarPlus.showText('Your Text');

// Abertura de SnackBar com widget customizado. 
snackBarPlus.show(child: YourWidget());
```

**• Configuração:**

```dart
// Opção 1 -> inserir a key direto no seu MaterialApp.
return MaterialApp(
...
	builder: (context, child) {
        return Scaffold(
          key: snackBarPlus.scaffoldKey,
          body: child,
        );
	},
...
);
```

```dart
// Opção 2 -> Substituir o MaterialApp pelo FlutterAppPlus.
return FlutterAppPlus(
...
);
```

**• Acesso:**

```dart
// Formas de acessar.
snackBarPlus.show(...);
FlutterPlus.snackBar.show(...);
```

### `📌 LocalStoragePlus`

O LocalStoragePlus possibilita persistir e acessar dados locais em qualquer lugar do seu código.

> Utiliza a dependência `shared_preferences`.

```dart
// Salvar dados locais. 
await localStoragePlus.write('lib_name', 'flutter_plus');

// Ler dados locais. 
await localStoragePlus.read('lib_name');

// Apagar dados locais. 
await localStoragePlus.delete('lib_name');

// Verificar se existe dados locais. 
await localStoragePlus.containsKey('lib_name');

// Limpar todos os dados locais. 
await localStoragePlus.clear();
```

**• Acesso:**

```dart
// Formas de acessar.

localStoragePlus...;

FlutterPlus.localStorage...;
```

### `📌 UtilsPlus`

UtilsPlus disponibiliza funções para auxiliar no desenvolvimento do seu aplicativo.

```dart
// Fechar o teclado caso esteja aberto. 
utilsPlus.closeKeyboard();

// Obter um Color a partir de um Hex. 
Color customColor = utilsPlus.colorHex('FFFFFF');
```

**• Acesso:**

```dart
// Formas de acessar.

utilsPlus...;

FlutterPlus.utils...;
```

## 🧩 Extensions

Contribution is not limited to software developers, since there are other ways you can help. For example, contributing towards documentation, translation and support. Join the room on Gitter to see how you can help (see below).

### `📌 StringExtensionPlus`

**• Propriedades:**

| Propriedade | Exemplo | Resultado |
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

**• Exemplo:**

```dart
String dateStr = "01/01/2020 10:00:00";
DateTime date = dateStr.toDate("dd/MM/yyyy");
print(date.year); 
// 2020
```

### `📌 DateExtensionPlus`

**• Propriedades:**

| Propriedade | Tipo Retorno | Função |
| ---| --- | --- |
| format | `String` | String com a data formatada 
| daysOfMonth | `int` | Quantidade de dias do mês
| daysOfYear | `int` | Quantidade de dias do ano (366 quando ano binário)
| isToday | `bool` | Verdadeiro ou falso
| monthName | `String` | Nome do mês
| monthNameSort | `String` | Nome do mês resumido
| weekName | `String` | Dia da semana
| weekNameSort | `String` | Dia da semana resumido

**• Exemplo:**

```dart
DateTime.now date = DateTime.now();
String dateStr = date.format("dd/MM/yyyy");
print(dateStr); 
// 01/01/2020
```

### `📌 NumExtensionPlus`

**• Propriedades:**

| Propriedade | Tipo Retorno | Função |
| ---| --- | --- |
| toCurrency | `String` | Formata para moeda local
| toCurrencyCompact | `String` | Formata para moeda local resumida
| toPrecision | `double` | Define número de casas decimais
| daysToHours | `int` | Dias para horas
| minutesToHours | `int` | Minutos para horas
| secondsToHours | `int` | Segundos para horas
| hoursToDays | `int` | Horas para dias
| secondsToMinutes | `int` | Segundos para minutos
| hoursToMinutes | `int` | Horas para minutos
| isNullOrZero | `bool` | Verifica se é diferente de nulo ou zero

**• Exemplo:**

```dart
double value = 13512.98;
print(value.toCurrency()); 
// $ 13,512.98
// R$ 13.512,98
```

### `📌 FileExtensionPlus`

**• Propriedades:**

| Propriedade | Tipo Retorno | Função |
| ---| --- | --- |
| base64Sync | `String` | Converte para base64 sync
| base64Async | `String` | Converte para base64 async

**• Exemplo:**

```dart
File customFile = File(path);
String base64 = customFile.base64Sync;
```

### `📌 DurationExtensionPlus`

**• Propriedades:**

| Propriedade | Tipo Retorno | Função |
| ---| --- | --- |
| months | `int` | Retorna a quantidade de meses do Duration
| days | `int` | Retorna a quantidade de dias do Duration
| hours | `int` | Retorna a quantidade de horas do Duration
| hoursStr | `String` | Retorna a quantidade de horas formatada do Duration
| minutes | `int` | Retorna a quantidade de minutos do Duration
| minutesStr | `String` | Retorna a quantidade de minutos formatado do Duration
| seconds | `int` | Retorna a quantidade de segundos do Duration
| secondsStr | `String` | Retorna a quantidade de segundos formatado do Duration
| formattedDuration | `String` | Retorna o Duration formatado

**• Exemplo:**

```dart
Duration customDuration = Duration(hours: 10, minutes: 4, seconds: 55);
print(customDuration.days); // 0
print(customDuration.hours); // 10
print(customDuration.minutesStr); // 04
print(customDuration.formattedDuration); // 10:04:55
```

# 🎯 Próximos passos

📌 Documentação detalhada dos componentes.

📌 Rotas

📌 ScaffoldPlus.

📌 GridViewPlus.

📌 ListViewPlus.

📌 LoadingPlus.

📌 ThemePlus.

📌 TranslatePlus.

📌 ∞