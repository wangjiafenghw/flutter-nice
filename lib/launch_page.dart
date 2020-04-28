import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('如何打开第三方软件'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => _launchURL(),
              child: Text('打开去哪儿网首页'),
            ),
            RaisedButton(
              onPressed: () => _openMap(),
              child: Text('打开地图'),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'http://touch.qunar.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能打开 $url';
    }
  }
  _openMap() async{
    // Android
    const url = 'geo:52.32,49.17';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能打开 $url';
    }
  }
}
