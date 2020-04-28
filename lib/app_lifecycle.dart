import 'package:flutter/material.dart';


class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if(state == AppLifecycleState.paused){
      print('App进入后台');
    }else if(state == AppLifecycleState.resumed){
      print('App进入前台');
    }else if(state == AppLifecycleState.inactive){
      print('APP处于非激活状态');
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
