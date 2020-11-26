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
	- [Demonstração](#-demonstração)
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
	- [Atributos](#-atributos)
		- [BorderPlus](#-borderplus)
		- [GradientPlus](#-gradientplus)
		- [InnerShadowPlus](#-innershadowplus)
		- [RadiusPlus](#-radiusplus)
		- [ShadowPlus](#-shadowplus)
		- [SkeletonPlus](#-skeletonplus)
		- [TextDecorationPlus](#-textdecorationplus)
- [Próximos Passos](#-próximos-passos)

# 👾 FlutterPlus

### Criar aplicativos utilizando Flutter é ótimo, mas pode ficar melhor!

FlutterPlus é uma biblioteca open-source criada para tornar o desenvolvimento em Flutter mais rápido, fácil e intuitivo.

Crie **Containers**, **Buttons**, **TextFields**, **Texts** e **RichTexts** customizados com poucas linhas.

Navegue entre **Telas**, abra **BottomSheets**, **Dialogs** e **Snackbars** sem contexto de qualquer lugar do seu código.

Utilize extensões para tratar **datas**, **strings**, **números** e **arquivos**.

> **Muitas das soluções encontradas aqui foram criadas para uso próprio ao longo da minha jornada com Flutter.
> Resolvi reunir tudo uma único lugar para auxiliar meu trabalho e o de quem interessar. ;)**

> Tentarei sempre manter a documentação atualizada porém pode acontecer de esquecer de colocar uma coisa ou outra aqui ;)

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

> **- Esta biblioteca estará sempre em constante evolução, então:**
> 
> 1- Se você não quer ter problemas como nomes ou atributos mudando e parando de funcionar, sugiro fixar a versão quando for começar a utilizar.
> 
> 2- Se você for como eu que gosta de evolução e não se importa em um pouco de retrabalho quando for para melhor, deixe sem versão fixa e fique ligado nos updates ;) 

_*Não é necessário nenhum ajuste extra para funcionar no iOS, Android, Web ou Desktop._

# 📚 Exemplos

A seguir existem exemplos de como usar e configurar os principais recursos da biblioteca.

_*Você também encontra um projeto de exemplo mostrando como utilizar a biblioteca [aqui](https://github.com/gbmiranda/flutter_plus/tree/master/example)._

## 🍬 Demonstração

Um aperitivo do real significado da biblioteca. Dois códigos que fazem a mesma coisa, o primeiro com widgets nativos e o segundo utilizando a biblioteca.

> Um Container customizado com um texto centralizado que aceite interação do usuário. 

## 🛠 Widgets

Os *Widgets* abaixo são evoluções dos nativos do Flutter. Foram criados para aumentar a produtividade facilitar a customização, com atributos mais poderosos e intuitivos. 

> **Crie Widgets mais complexos com menos código.**

### `📌 ContainerPlus`

Para mim o widget *Container* é a base do Flutter. O nosso **ContainerPlus** é uma evolução do nativo, mais fácil de customizar e com diversas propriedades.

> **Exemplo 1:**

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

> **Exemplo 2:**

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

> **Exemplo 3:**

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

### `📌 ButtonPlus`

> **Exemplo 1:**

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

> **Exemplo 2:**

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

> **Exemplo 3:**

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

> **Exemplo 4:**

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

### `📌 TextFieldPlus`

> **Exemplo 1:**

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

> **Exemplo 2:**

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

> **Exemplo 3:**

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

### `📌 TextPlus`

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

## 🔧 Utils

Além dos Widgets padrões temos algumas abstrações que vão te economizar código e tempo para você focar no que realmente importa para seu projeto. 

### `📌 NavigatorPlus`

O NavigatorPlus possibilita a navegação entre telas de qualquer lugar do seu código, sem a necessidade de um `context`.

**• Navegar para próxima tela:**

```dart
// Navegar para tela desejada
navigatorPlus.show(NextScreen());
```

```dart
// Abrir tela desejada como modal
navigatorPlus.showModal(NextScreen());
```

**• Voltar tela:**

```dart
// Voltar para tela anterior
navigatorPlus.back();
```

```dart
// Verificar se existe tela anterior para voltar
if (navigatorPlus.canBack) {
  navigatorPlus.back();
}
```

```dart
// Voltar para primeira tela da pilha
navigatorPlus.backAll();
```

**• Retornar dados para tela de origem:**

```dart
// Chamar a próxima tela com await esperando um retorno
var result = await navigatorPlus.show(NextScreen());

// Voltar para tela anterior passando os dados desejados
navigatorPlus.back(result: customData);
```

**• Configuração:**

> Recomendada: Substituir o MaterialApp pelo FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternativa: Adicionar as chaves do navigatorPlus e do snackBarPlus.

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
// Pegar context atual
BuildContext context = navigatorPlus.currentContext;
```

**• Acesso:**

```dart
navigatorPlus.show(NextScreen());

FlutterPlus.navigator.show(NextScreen());
```

### `📌 BottomSheetPlus`

O BottomSheetPlus possibilita a abertura em qualquer lugar do seu código, sem a necessidade de um `context`.

> Necessita configurar para funcionar.

```dart
bottomSheetPlus.show(
  child: CustomWidget(),
  radius: RadiusPlus.top(20),
  heightPercentScreen: 0.3,
);
```

**• Acesso:**

```dart
bottomSheetPlus.show(...);

FlutterPlus.bottomSheet.show(...);
```

**• Configuração:**

> Recomendada: Substituir o MaterialApp pelo FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternativa: Adicionar as chaves do navigatorPlus e do snackBarPlus.

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

O DialogPlus possibilita abrir um dialog com layout já definido um próprio.

> Necessita configurar para funcionar.

```dart
// Abertura de Dialog default customizável

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
```dart
// Abertura de Dialog com layout próprio

  dialogPlus.show(
    child: CustomWidget(),
    radius: RadiusPlus.all(20),
    closeKeyboardWhenOpen: true,
  );
```

**• Acesso:**

```dart
dialogPlus.show(...);

FlutterPlus.dialog.show(...);
```

**• Configuração:**

> Recomendada: Substituir o MaterialApp pelo FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternativa: Adicionar as chaves do navigatorPlus e do snackBarPlus.

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

O SnackBarPlus possibilita a abertura em qualquer lugar do seu código, sem a necessidade de um `scaffold`.

```dart
// Abertura de SnackBar com texto simples

snackBarPlus.showText(
  'FlutterPlus',
  textColor: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  backgroundColor: Colors.green,
);
```

```dart
// Abertura de SnackBar com widget customizado

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

**• Configuração:**

> Recomendada: Substituir o MaterialApp pelo FlutterAppPlus.

```dart
return FlutterAppPlus(
  title: 'Flutter Plus Example',
  home: HomeScreen(),
);
```

> Alternativa: Adicionar as chaves do navigatorPlus e do snackBarPlus.

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

**• Acesso:**

```dart
snackBarPlus.show(...);

FlutterPlus.snackBar.show(...);
```

### `📌 LocalStoragePlus`

O LocalStoragePlus possibilita persistir e acessar dados locais em qualquer lugar do seu código.

```dart
// Salvar dados locais
await localStoragePlus.write('lib_name', 'flutter_plus');

// Ler dados locais
await localStoragePlus.read('lib_name');

// Apagar dados locais
await localStoragePlus.delete('lib_name');

// Verificar se existe dados locais
await localStoragePlus.containsKey('lib_name');

// Limpar todos os dados locais
await localStoragePlus.clear();
```

**• Acesso:**

```dart
localStoragePlus...;

FlutterPlus.localStorage...;
```

> Utiliza a dependência `shared_preferences`.

### `📌 UtilsPlus`

UtilsPlus disponibiliza funções para auxiliar no desenvolvimento do seu aplicativo.

```dart
// Fechar o teclado caso esteja aberto
utilsPlus.closeKeyboard();

// Obter um Color a partir de um Hex
Color customColor = utilsPlus.colorHex('FFFFFF');
```

**• Acesso:**

```dart
utilsPlus...;

FlutterPlus.utils...;
```

## 🧩 ExtensionsPlus

Por último mas não menos importante, ***Extensions*** são uma poderosa ferramenta para facilitar certas tarefas sem a necessidade de replicar código várias vezes.

Nessa seção você irá várias extensões para os tipos ***String***, ***Date***, ***Num***, ***File***, ***Duration***.

> As vezes é difiícl manter tudo atualizado, então podem surgir novas propriedades que não estão aqui.s

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

## ⚙️ Atributos

Os atributos de customização abaixo são utilizados na maioria dos Widgets acima.

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