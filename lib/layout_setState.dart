import 'package:flutter/material.dart';
import 'common/footerBar.dart';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IndexState();
}

class IndexState extends State<Layout> {
  int _indexes = 0; //页面索引
  List<StatefulWidget> _indexBody; //页面
  List<FooterBar> _footerBar; //底部按钮
  StatefulWidget _indexesPage; //当前页

  //定义设置状态的方法
  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _footerBar = <FooterBar>[
      new FooterBar(
          icon: new Icon(Icons.home), title: new Text('home'), vsync: this),
      new FooterBar(
          icon: new Icon(Icons.home), title: new Text('home'), vsync: this),
      new FooterBar(
          icon: new Icon(Icons.home), title: new Text('home'), vsync: this),
      new FooterBar(
          icon: new Icon(Icons.home), title: new Text('home'), vsync: this),
    ];

    for (FooterBar view in _footerBar) {
      view.controller.addListener(_rebuild);
    }

    _indexBody = <StatefulWidget>[
    ];

    _indexesPage = _indexBody[_indexes];
  }
  //通过一个setstate在点击按钮时把页面塞入原本设定好的放页面的body中,body一直都是内容，内容随按钮变化而变化,设置索引确定当前引用的是那个页面
  final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
    items: _footerBar.map((FooterBar navigationIconView)=>navigationIconView.item).toList(),
    currentIndex: _indexes,
    type: BottomNavigationBarType.fixed,
    onTap: (int index){
      setState(() {
        _indexBody[_indexes].controller.reverse();
        _indexes = index;
        _indexBody[_indexes].controller.forward();
        _indexesPage = _pageList[_indexes]; 
      });
    },
  )

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _indexesPage
        ),
        bottomNavigationBar: Text('foot'),
      ),
    );
  }
}
