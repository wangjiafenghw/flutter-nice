
import 'package:flutter/material.dart';
///初始化时期
///更新期间
///销毁期
class WidgetLifecycle extends StatefulWidget {

  ///createState 必须重写，会被首先执行
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _num = 0;
  @override
  void initState() {
    print('-----initState------');
    super.initState();
  }
  ///initState后立即调用
  @override
  void didChangeDependencies() {
    print('-----didChangeDependencies------');
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  @override
  void deactivate() {
    print('-----deactivate------');
    super.deactivate();
  }
  @override
  void dispose() {
    print('-----dispose------');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('-------build-------');
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget生命周期'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _num++;
          });
        },
        child: Text('$_num', style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
