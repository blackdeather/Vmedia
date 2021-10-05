import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Главное окно')),
        body: Center(child: RaisedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));

        }, child: Text('Открыть второе окно'))),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          },
          child: Icon(Icons.settings),
        ),

      ),

    );
  }
}

class SecondScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('second page'),),
        body: Column(
          children: <Widget>[
            TextField(onTap: (){}, style: TextStyle(fontSize: 24), maxLength: 30, maxLines: 1, textAlignVertical: TextAlignVertical.center,),

            Center(child: RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('back'),
            ),),
          ],
        ),
      ),
    );
  }
}


class SettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('settings'),),
        body: Column(
          children: <Widget>[


            Center(child: RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('back'),
            ),),
          ],
        ),
      ),
    );
  }
}


