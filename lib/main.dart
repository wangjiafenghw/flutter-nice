import 'package:flutter/material.dart';
import 'package:flutter_tt/less_group_page.dart';
import 'package:flutter_tt/plugin_use.dart';
import 'package:flutter_tt/res_page.dart';

import 'app_lifecycle.dart';
import 'camera.dart';
import 'flutter_layout_page.dart';
import 'flutter_widget_lifecycle.dart';
import 'ful_group_page.dart';
import 'gesture_page.dart';
import 'launch_page.dart';

void main() => runApp(DynamicTheme());

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
//          fontFamily: 'ZCOOLQingKeHuangYou',
          brightness: _isDarkTheme ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: Text(
                '页面路由练习',
                style: TextStyle(fontFamily: 'ZCOOLQingKeHuangYou'),
              )
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('切换主题'),
                onPressed: (){
                  setState(() {
                    _isDarkTheme = !_isDarkTheme;
                  });
                },
              ),
              RouteNavigator(),
            ],
          )
        ),
        routes: <String, WidgetBuilder>{
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StateFullGroup(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
          'plugin': (BuildContext context) => PluginUse(),
          'GesturePage': (BuildContext context) => GesturePage(),
          'ResPage': (BuildContext context) => ResPage(),
          'LaunchPage': (BuildContext context) => LaunchPage(),
          'WidgetLifecycle': (BuildContext context) => WidgetLifecycle(),
          'AppLifecycle': (BuildContext context) => AppLifecycle(),
          'CameraApp': (BuildContext context) => CameraApp(),
        }
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName?'':'不'}通过路由名跳转'),
            value: byName,
            onChanged: (value){
              setState(() {
                byName = value;
              });
            },
          ),
          ListView(
            children: <Widget>[
              _item("无状态组件", LessGroupPage(), 'less'),
              _item("有状态组件", StateFullGroup(), 'ful'),
              _item("布局练习", FlutterLayoutPage(), 'layout'),
              _item("插件使用", PluginUse(), 'plugin'),
              _item("如何检测用户手势以及处理点击事件？", GesturePage(), 'GesturePage'),
              _item("使用资源文件", ResPage(), 'ResPage'),
              _item("打开第三方软件", LaunchPage(), 'LaunchPage'),
              _item("Widget生命周期", WidgetLifecycle(), 'WidgetLifecycle'),
              _item("App生命周期", AppLifecycle(), 'AppLifecycle'),
              _item("拍照APP", CameraApp(), 'CameraApp')
            ],
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => page)
            );
          }
        },
        child: Text(title)),
    );
  }
}
