import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:curso_flutter/pages/contact.dart';
import 'package:curso_flutter/pages/home.dart';
import 'package:curso_flutter/pages/video.dart';

void main() => runApp(MaterialApp(
  home: MyTabs()
));
//Tabs
class MyTabs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyTabsState();
  }
}
class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video Tabs"),
        backgroundColor: Colors.redAccent,
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home)
            ),
            Tab(
              icon: Icon(Icons.ondemand_video)
            ),
            Tab(
              icon: Icon(Icons.contacts)
            )
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Home(),
          Video(),
          Contact()
        ],
        controller: controller,
      )
    );
  }

}
//Stepper
class MyStepper extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStepperState();
  }
}
class MyStepperState extends State<MyStepper>{
  static int _currentStep = 0;
  static List<Step> mySteps = [
    Step(
      title:Text("paso 1"),
      content: Text("aprender flutter")
    ),
    Step(
      title: Text("paso 2"),
      content: Text("contenido paso 2")
    ),
    Step(
      title: Text("paso 3"),
      content: Text("contenido paso 3")
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steper")
      ),
      body: Container(
        child: Stepper(
          //type: StepperType.horizontal,
          currentStep: _currentStep,
          steps: mySteps,
          onStepCancel: (){
            setState((){
              if(_currentStep > 0) {
                _currentStep--;
              }else{
                _currentStep = 0;
              }
            });
          },
          onStepContinue: (){
            setState((){
              if(_currentStep < mySteps.length -1) {
                _currentStep++;
              }else{
                _currentStep = 0;
              }
            });
          },
          onStepTapped: (step){
            setState((){
              _currentStep = step;
            });
          },
        ),
      )
    );
  }

}

//Conexion Dato
class Dato {
  final int id;
  final String nombre;

  Dato({this.id, this.nombre});

  factory Dato.fromJson(Map<String, dynamic> json) {
    return Dato(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}

Future<Dato> fetchDato() async {
  final response =
  await http.get('http://192.168.0.5/conexionBD-spring/dato/100');
  if (response.statusCode == 200) {
    return Dato.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error al recibir el dato');
  }
}

class PeticionHttp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("prueba http"),
      ),
      body: Center(
        child: FutureBuilder<Dato>(
          future: fetchDato(),
          builder: (context, snapshot){ return _crearMensaje(context, snapshot);}
        ),
      )
    );
  }

  Widget _crearMensaje(context, snapshot){
    if (snapshot.hasData) {
      return Text(snapshot.data.nombre);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    // Por defecto, muestra un loading spinner
    return CircularProgressIndicator();
  }
}

//AlertDialog
class MyAlertDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAlertDialogState();
  }
}

class MyAlertDialogState extends State<MyAlertDialog>{

  String mensaje = "";
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alertDialog")
      ),
      body: Container(
        child: Center(
          child:Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "ingresa el texto"
                ),
                onChanged: (String value){onSubmitted(value);},
                controller: controller,
              ),
              RaisedButton(
                child: Text("ver Alerta"),
                onPressed: (){_showAlert(mensaje);},
              )
            ],
          )
        ),
      )
    );
  }
  void onSubmitted(value){
    setState((){
      mensaje = value;
    });
  }
  void _showAlert(String value){
    AlertDialog alert = new AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(onPressed: (){_alertResult('si');}, child: Text("si")),
        FlatButton(onPressed: (){_alertResult('no');}, child: Text("no")),
      ],
    );
    controller.text = "";
    showDialog(context: context, child: alert);
  }

  void _alertResult(String result){
    print('El resultado es ${result}');
    Navigator.pop(context);
  }
}
//TextView
class MyTextView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MytextViewState();
  }
}
class MytextViewState extends State<MyTextView>{
  String texto = "";
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextView"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "introduce el texto"
                  ),
                    onSubmitted: (String value){onSubmitted(value);},
                    controller: controller,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                ),
                Text(texto)
              ],
            )
          )
      )
    );
  }
  void onSubmitted(String value){
    setState((){
      texto += "\n" + value;
      controller.text = "";
    });

  }
}
//Boton
class MyButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton>{
  static List<String> collection = ['flutter', 'es', 'genial'];
  static int index = 0;
  String flutterText = collection[index];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("statefulWidget")
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(flutterText,
                style: TextStyle(
                  fontSize: 40.0
                )
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text("Actualizar",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                color: Colors.redAccent,
                onPressed: onPressButton,
              )
            ],
          )
        )
      )
    );
  }
  void onPressButton(){
    setState((){
      index = index < collection.length - 1 ? index + 1 : 0;
      flutterText = collection[index];
      print(index);
    });
  }
}
//Stateless
class MyApp extends StatelessWidget{
  final double iconSize = 40.0;
  final TextStyle textStyle = TextStyle(
    fontSize: 30.0
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("hola")
      ),
      body: Container(
        child: Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyCard(
              titulo: Text("hola", style: textStyle),
              icon: Icon(Icons.favorite, size: iconSize, color: Colors.redAccent)
            ),
            MyCard(
              titulo: Text("video", style: textStyle),
              icon: Icon(Icons.thumb_up, size: iconSize, color: Colors.blueAccent)
            ),
            MyCard(
              titulo: Text("siguiente video", style: textStyle),
              icon: Icon(Icons.queue_play_next, size: iconSize)
            )
          ],
        )
        )
      )
    );
  }
}

class MyCard extends StatelessWidget{
  final Widget titulo;
  final Widget icon;
  MyCard({this.titulo, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              titulo,
              icon
            ],
          ),
        )
      )
    );
  }
}