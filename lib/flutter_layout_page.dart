import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
///FlutterLayoutPage
class FlutterLayoutPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: ColorUtil.color('#ffffff'),),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network('https://s1.ax1x.com/2020/04/27/JfhK0S.jpg'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(opacity: 0.3,
                        child: Image.network('https://s1.ax1x.com/2020/04/27/JfhK0S.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(10),
                child: PhysicalModel(color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  clipBehavior: Clip.antiAlias, // 抗锯齿
                  child: PageView(
                    children: <Widget>[
                      _item('Page1', ColorUtil.color('#ff6700')),
                      _item('Page2', Colors.blue),
                      _item('Page3', Colors.black)
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(color: ColorUtil.color('#ff6700'),),
                      child: Text('宽度撑满'),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        child: PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network('https://s1.ax1x.com/2020/04/27/JfhK0S.jpg',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Opacity(opacity: 0.8,
                          child: Image.network('https://s1.ax1x.com/2020/04/27/JfhK0S.jpg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: <Widget>[
                      _chip('Flutter'),
                      _chip('进阶'),
                      _chip('实战'),
                      _chip('去哪儿'),
                      _chip('App')
                    ],
                  )
                ],
              ),
//              Icon(
//                Icons.android,
//                size: 50,
//                color: Colors.red,
//              ),
//              Chip(
//                label: Text('jeff wang'),
//                avatar: Icon(Icons.people),
//              ),
//              Divider(
//                height: 10,
//                indent: 10,
//                color: Colors.orange,
//              ),
//              Card(
//                color: Colors.blue,
//                elevation: 5,
//                margin: EdgeInsets.all(10),
//                child: Container(
//                  padding: EdgeInsets.all(10),
//                  child: Text(
//                    'I am Card',
//                    style: textStyle,
//                  ),
//                ),
//              ),
//              AlertDialog(
//                title: Text('干他'),
//                content: Text('Hello World'),
//              )
            ],
          ),
        ),
      ),
    );
  }
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }

  _chip(String label) {
    return Chip(label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
