import 'package:flutter/cupertino.dart';
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
            VideoImagePreview(),
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
  Uri result = Uri.parse('https://api.vk.com/method/video.search?q=$requestText&count=10&access_token=6dd1fc1c10e1ec36cdad942392bf538e95ae81e714c5aea879a5a70d5ab08d302f6489164a99fae236e58&v=5.131');
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


class VideoImagePreview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircularOrImage(true, 'imageUrl'),
        Text('name videofile'),
      ],
    );
  }
}



class CircularOrImage extends StatelessWidget{

  late bool _isLoaded;
  late String _imageUrl;

  CircularOrImage(isLoaded, imageUrl){
    _isLoaded = isLoaded;
    _imageUrl = imageUrl;
  }

  @override
  Widget build (BuildContext context){
    return _isLoaded ? CircularProgressIndicator() : Image.network(_imageUrl);
  }

}


