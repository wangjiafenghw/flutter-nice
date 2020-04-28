import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StateFullGroup extends StatefulWidget {
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}

class _StateFullGroupState extends State<StateFullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StateFulWidget与基础组件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text(
                '首页',
              )
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: Text(
                '列表',
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0 ?
            RefreshIndicator(child:
            ListView(
              children: <Widget>[
                  Container(
                  decoration: BoxDecoration(color: ColorUtil.color('#ffffff'),),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 5),
                        child: Image.network('https://img-blog.csdnimg.cn/20190323161159133.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      TextField(
                        // 输入框样式
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          hintText: '请输入',
                          hintStyle: TextStyle(fontSize: 18)
                        ),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(color: Colors.lightBlueAccent),
                        child: PageView(
                          children: <Widget>[
                            _item('Page1', ColorUtil.color('#ff6700')),
                            _item('Page2', Colors.blue),
                            _item('Page3', Colors.black)
                          ],
                        ),
                      )
                    ],
                  ),
                  )
              ],
            ),
            onRefresh: _handleRefresh,
            )
            : Column(
          children: <Widget>[
            Text('列表'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.red, ),
                child: Text('ffsdffasdfasd'),
              )
            )
          ],
        ),
      ),
    );
  }
  Future<Null>_handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }
}

