import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:frigodart/slide_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FrigoDart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'FrigoDart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var variavel;
  SlideListViewState controller;
  String nome_alimento = "";
  String url_img = "", intrucoes = "";
  String strIngredient1 = "";
  String strIngredient2 = "";
  String strIngredient3 = "";
  String strIngredient4 = "";
  String strIngredient5 = "";
  String strIngredient6 = "";
  String strIngredient7 = "";
  String strIngredient8 = "";
  String strIngredient9 = "";
  String strIngredient10 = "";
  String strIngredient11 = "";
  String strIngredient12 = "";
  String strIngredient13 = "";
  String strIngredient14 = "";
  String strIngredient15 = "";
  String strIngredient16 = "";
  String strIngredient17 = "";
  String strIngredient18 = "";
  String strIngredient19 = "";
  String strIngredient20 = "";
  String categoria = "";
  String area = "";

  @override
  void initState() {
    super.initState();
    retorna();
  }

  Future<Map> fetch() async {
    var url = "https://www.themealdb.com/api/json/v1/1/random.php";
    var response = await http.get(url);
    variavel = jsonDecode(response.body);
    nome_alimento = variavel['meals'][0]['strMeal'].toString();
    url_img = variavel['meals'][0]['strMealThumb'].toString();
    intrucoes = variavel['meals'][0]['strInstructions'].toString();
    atribuir(variavel);
    return variavel;
  }

  Future atribuir(variavel) async {
    strIngredient1 = variavel['meals'][0]['strIngredient1'].toString();
    strIngredient2 = variavel['meals'][0]['strIngredient2'].toString();
    strIngredient3 = variavel['meals'][0]['strIngredient3'].toString();
    strIngredient4 = variavel['meals'][0]['strIngredient4'].toString();
    strIngredient5 = variavel['meals'][0]['strIngredient5'].toString();
    strIngredient6 = variavel['meals'][0]['strIngredient6'].toString();
    strIngredient7 = variavel['meals'][0]['strIngredient7'].toString();
    strIngredient8 = variavel['meals'][0]['strIngredient8'].toString();
    strIngredient9 = variavel['meals'][0]['strIngredient9'].toString();
    strIngredient10 = variavel['meals'][0]['strIngredient10'].toString();
    strIngredient11 = variavel['meals'][0]['strIngredient11'].toString();
    strIngredient12 = variavel['meals'][0]['strIngredient12'].toString();
    strIngredient13 = variavel['meals'][0]['strIngredient13'].toString();
    strIngredient14 = variavel['meals'][0]['strIngredient14'].toString();
    strIngredient15 = variavel['meals'][0]['strIngredient15'].toString();
    strIngredient16 = variavel['meals'][0]['strIngredient16'].toString();
    strIngredient17 = variavel['meals'][0]['strIngredient17'].toString();
    strIngredient18 = variavel['meals'][0]['strIngredient18'].toString();
    strIngredient19 = variavel['meals'][0]['strIngredient19'].toString();
    strIngredient20 = variavel['meals'][0]['strIngredient20'].toString();
    categoria = variavel['meals'][0]['strCategory'].toString();
    area = variavel['meals'][0]['strArea'].toString();
  }

  Future retorna() async {
    variavel = await fetch();
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SlideListView(
        view1: buildPage2(Colors.red, sizeW, sizeH),
        view2: buildPage(Colors.white12, sizeW, sizeH),
        //    floatingActionButtonColor: Colors.yellow[800],
        //    floatingActionButtonIcon: AnimatedIcons.view_list,
        showFloatingActionButton: false,
        defaultView: "slides",
        duration: Duration(
          milliseconds: 800,
        ),
      ),
    );
  }

  Container buildPage(Color color, sizeW, sizeH) {
    return Container(
        alignment: Alignment.center,
        width: sizeW,
        height: sizeH,
        color: Colors.white24,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              width: sizeW,
              color: Colors.grey,
              child: Image.network(
                url_img,
                width: 350,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: sizeW,
              margin: EdgeInsets.all(5.0),
              height: 5,
              color: Colors.grey,
              child: null,
            ),
            Container(
              alignment: Alignment.center,
              width: sizeW,
              child: Text(
                nome_alimento.toString(),
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            FloatingActionButton(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    retorna();
                    nome_alimento = variavel['meals'][0]['strMeal'].toString();
                    url_img = variavel['meals'][0]['strMealThumb'].toString();
                    intrucoes =
                        variavel['meals'][0]['strInstructions'].toString();
                  });
                }),
            Container(
              alignment: Alignment.center,
              width: sizeW,
              margin: EdgeInsets.all(5.0),
              height: 5,
              color: Colors.grey,
              child: null,
            ),
            Container(
              width: sizeW,
              child: Text(
                "\n Categoria:" + categoria + " \n " + "Area: " + area + "\n",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              width: sizeW,
              child: Text(
                "\n Modo de Preparo\n ",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              width: sizeW,
              child: Text(
                intrucoes.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: sizeW,
              margin: EdgeInsets.all(5.0),
              height: 5,
              color: Colors.grey,
              child: null,
            ),
            Container(
              width: sizeW,
              child: Text(
                "\n Igredientes \n",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              width: sizeW,
              child: Text(
                strIngredient1.toString() +
                    "\n" +
                    strIngredient2.toString() +
                    "\n" +
                    strIngredient3.toString() +
                    "\n" +
                    strIngredient4.toString() +
                    "\n" +
                    strIngredient5.toString() +
                    "\n" +
                    strIngredient6.toString() +
                    "\n" +
                    strIngredient7.toString() +
                    "\n" +
                    strIngredient8.toString() +
                    "\n" +
                    strIngredient9.toString() +
                    "\n" +
                    strIngredient10.toString() +
                    "\n" +
                    strIngredient11.toString() +
                    "\n" +
                    strIngredient12.toString() +
                    "\n" +
                    strIngredient13.toString() +
                    "\n" +
                    strIngredient14.toString() +
                    "\n" +
                    strIngredient15.toString() +
                    "\n" +
                    strIngredient16.toString() +
                    "\n" +
                    strIngredient17.toString() +
                    "\n" +
                    strIngredient18.toString() +
                    "\n" +
                    strIngredient19.toString() +
                    "\n" +
                    strIngredient20.toString() +
                    "\n",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ));
  }

  Container buildPage2(Color color, sizeW, sizeH) {
    return Container(
      alignment: Alignment.center,
      width: sizeW,
      height: sizeH,
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.yellowAccent,
          width: sizeW,
          height: sizeH * 0.35,
          child: Column(
            children: [
              Container(
                width: sizeW,
                child: Text(
                  "\n Frigo Dart\n ",
                  style: TextStyle(fontSize: 30.0, color: Colors.blueGrey),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                height: 46,
                child: Text(
                  "d",
                  style: TextStyle(
                      backgroundColor: Colors.yellowAccent,
                      color: Colors.yellowAccent),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                height: 20,
                child: Text(
                  "DA geladeira",
                  style: TextStyle(
                      backgroundColor: Colors.blueGrey, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topRight,
          color: Colors.yellow,
          width: sizeW,
          height: sizeH * 0.65,
          child: Text(
            "porta da geladeira",
            style: TextStyle(
                backgroundColor: Colors.blueGrey, color: Colors.blueGrey),
          ),
        ),
      ]),
    );
  }
}
