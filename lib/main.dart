import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
String _requestText = 'Sponge bob';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Главное окно')),
        body: Column(
          children: [
            TextField(
              onChanged: (text){
                _requestText = text;
              },
              style: TextStyle(fontSize: 24), maxLength: 30, maxLines: 1, textAlignVertical: TextAlignVertical.center,),
            Center(child: RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
              GetJson(SearchVideoRequest(_requestText));

            }, child: Text('search'))),
          ],
        ),
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
        appBar: AppBar(title: Text('player'),),
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


Uri SearchVideoRequest(String requestText){
  Uri result = Uri.parse('https://api.vk.com/method/video.search?q=$requestText&count=10&access_token=bb57a5ebbfed1eb3200ad1ca9a03265c41c2d934f0c9d2e23fe9611b0086a654c8729ecb3072841b3febd&v=5.131');
  return result;

}

void GetJson (Uri url) async {
  http.get(url).then((response) {
    String d = url.toString();
    print(response.statusCode);
    print(response.body);
  }).catchError((error){
    print('Error$error');
  });
}




