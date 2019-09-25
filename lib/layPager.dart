import 'package:flutter/material.dart';
import 'BottomBar.dart';
import 'templete/user.dart';
import 'templete/company.dart';
import 'templete/job.dart';
import 'templete/house.dart';

class MainPager extends StatefulWidget {
  @override
  _MainPager createState() => _MainPager();
}

class _MainPager extends State<MainPager> {
  BottomBar _barSelected = BottomBar.home; //初始默认页面

  /*
  设置图标
  BottomNavigationBarItem
  _buildItem对应BottomNavigationBarItem的函数 自定义名字
  该内置函数的参数
  arg: this.icon 当前图标   title 当前图标名称  Widget activeIcon,选中图标  this.backgroundColor type设置为shifting时，backgroundColor才有效
  BottomBar引入的菜单名字
  * */
  BottomNavigationBarItem _buildItem(
      {Icon icon, BottomBar bottomBar}) {
    String text = barName(bottomBar); //在bottombar中的BarName取出值文本

    return BottomNavigationBarItem(
      icon: icon,
      title: new Text(
        text,
        style: new TextStyle(
          color: _barSelected == bottomBar? Colors.blue[300] : Color.fromARGB(255, 95, 93, 93)
        ),
      )
    );
  }

  Widget _bottomNavigationBar() {
    /*
    BottomNavigationBar
    key
    item 子选项 BottomNavigationBarItem
    onTap 点击事件 
    currentIndex 选中的项
    BottomNavigationBarType 类型
    fixedColor 字体颜色
    iconSize icon大小 默认24
    */
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        // BottomNavigationBarItem(
        //   icon: new Icon(Icons.home), 上面对于BottomNavigationBarItem写了一个函数代替为 _buildItem
        // )
        _buildItem(
            icon: new Icon(Icons.home,color: _barSelected == BottomBar.home? Colors.blue[300] : Color.fromARGB(255, 95, 93, 93)),
            bottomBar: BottomBar.home),
        _buildItem(
            icon: new Icon(Icons.nature_people,color: _barSelected == BottomBar.company? Colors.blue[300] : Color.fromARGB(255, 95, 93, 93)),
            bottomBar: BottomBar.company),
        _buildItem(
            icon: new Icon(Icons.work,color: _barSelected == BottomBar.job? Colors.blue[300] : Color.fromARGB(255, 95, 93, 93)),
            bottomBar: BottomBar.job),
        _buildItem(
            icon: new Icon(Icons.people,color: _barSelected == BottomBar.user? Colors.blue[300] : Color.fromARGB(255, 95, 93, 93)),
            bottomBar: BottomBar.user,
            )
      ],
      onTap: _onSelectBar,
      backgroundColor: Colors.white,
      iconSize: 35.0,
    );
  }

  void barSelected(BottomBar selected) {
    setState(() {
      _barSelected = selected;
    });
  }

  void _onSelectBar(int index) {
    switch (index) {
      case 0:
        return barSelected(BottomBar.home);
        break;
      case 1:
        return barSelected(BottomBar.company);
        break;
      case 2:
        return barSelected(BottomBar.job);
        break;
      case 3:
        return barSelected(BottomBar.user);
        break;
    }
  }

  Widget _buildPager() {
    BottomBar bottomBar = _barSelected;
    switch (bottomBar) {
      case BottomBar.home:
        return HousePage();
        break;
      case BottomBar.company:
        return CompanyPage();
        break;
      case BottomBar.job:
        return JobPage();
        break;
      case BottomBar.user:
        return UserPage();
        break;
      case BottomBar.companyDetail:
        return UserPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // body: new Text('body'),
      body: _buildPager(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
