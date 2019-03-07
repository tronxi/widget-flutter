import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyAlertDialog()
));
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