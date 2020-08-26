import 'package:flutter/material.dart';
import 'package:flutter_fiap_aula1/addLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp()); //Widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DART - construtores e métodos, parâmertros opcionais
    //são criados com {} e na hora de usar eu precsio
    //passar propriedade: valor
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  //testes unitários
  //testes de integração
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  //arrow sintax
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<bool> selects = [false, false, false, false, false, false];
  //função auxiliar da List, recebe o número de elementos e a função pra popular
  List<bool> selects = List.generate(6, (index) => false);
  List<String> labels = [
    "Android Nativo",
    "iOS Nativo",
    "Flutter",
    "React Native",
    "PWA",
    "Ionic"
  ];

  //no DART, classes, variáveis, constantes e métodos que comecem com underline
  //são privados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: <Widget>[
              buildChoiceChip(0),
              buildChoiceChip(1),
              buildChoiceChip(2),
              buildChoiceChip(3),
              buildChoiceChip(4),
              buildChoiceChip(5),
            ],
          ),
          Expanded(
            child: ListView(children: buildListItens()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: () {
          Future future = Navigator.pushNamed(context, "/add");
          future.then((value) {

          });
        },
      ),
    );
  }

  ChoiceChip buildChoiceChip(int index) => ChoiceChip(
        label: Text(labels[index]),
        selected: selects[index],
        onSelected: (value) {
          setState(() {
            selects[index] = value;
          });
        },
      );

  List<Widget> buildListItens() {
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getiOSNativeOption,
      if (selects[2]) getFlutterOption,
      if (selects[3]) getReactNativeOption,
      if (selects[4]) getPwaOption,
      if (selects[5]) getIonicOption
    ];
  }

  Widget getNativeAndroidOption = Card(
    child: ListTile(
      leading: Icon(Icons.android),
      title: Text('Android Nativo'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getiOSNativeOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/apple.svg"),
      title: Text('iOS Nativo'),
      subtitle: Text('Linguagens Swift e Objective-C'),
    ),
  );

  Widget getFlutterOption = Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter (O melhor)'),
      subtitle: Text('Linguagens DART, Java, Kotlin, Swift e Objective-C'),
    ),
  );

  Widget getReactNativeOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/react.svg"),
      title: Text('React Native'),
      subtitle: Text('Linguagens stack web'),
    ),
  );

  Widget getPwaOption = Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('PWA'),
      subtitle: Text('Linguagens stack web'),
    ),
  );

  Widget getIonicOption = Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('Ionic'),
      subtitle: Text('Linguagens JavaScipt e TypeScript'),
    ),
  );
}
