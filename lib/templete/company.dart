import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

// import 'package:bogusboss/common/HttpRequest.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPage createState() => _CompanyPage();
}

class _CompanyPage extends State<CompanyPage> {
  Map<String, dynamic> companyData;
  int code;
  String badRequest;
  //initState页面渲染只走一次，setState需要事件触发，此处需要进入页面事渲染  故直接在初始化时渲染
  initState() {
    super.initState();
    _getCompanyList().then((val) {
      if (val['code'] is int) {
        setState(() {
          code = val['code'];
          badRequest = val['request'];
        });
      } else {
        setState(() {
          companyData = val;
        });
      }
    });
  }

  //构造每一行的数据 对该行的每一小片进行细分规划
  Widget _buildCompanyRow(data) {
    return new Row(children: <Widget>[
      new Expanded(
          //expanded加上后 star向右靠，未知
        child: new Container(
        child: new GestureDetector(
        onTap: () {
          print(data['id']);
        },
        child: new Row(
          children: <Widget>[
            new Text(
              data['id'].toString(),
              style: new TextStyle(fontSize: 0),
            ),
            new Image.network(
              data['logo'],
              width: 100,
              height: 100,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data['company'] != null ? data['company'] : "",
                  style: new TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  data['place'] != null ? data['place'] : "",
                  style: new TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  data['info'] != null ? data['info'] : "",
                  style: new TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ],
            ),
          ],
        ),
      ))),
      new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            // alignment: FractionalOffset.centerRight,
            margin: EdgeInsets.only(right: 5),
            child: new IconButton(
                onPressed: () {
                  setState(() {
                    data['hot'] = !data['hot'];
                  });
                },
                icon: Icon(
                  data['hot'] ? Icons.star : Icons.star_border,
                  color: data['hot'] ? Colors.red : null,
                )),
          )
        ],
      )
    ]);
  }

  //整个列表 此处需要接受该页面的全局数据 companyData
  Widget _createCompanyList() {
    List companyList = companyData['msg'];
    return new ListView.builder(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();
        // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= companyList.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          companyList.addAll(companyList.take(10));
        }
        return _buildCompanyRow(companyList[index]);
      },
    );
  }

  //future适用于发送请求 未知属性很多 在future情况下才能在initstate中使用
  Future _getCompanyList() async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient
        .getUrl(Uri.parse('http://10.7.202.87:8000/company/getList'));
    request.headers.add('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String _text = await response.transform(utf8.decoder).join();
      return json.decode(_text);
    } else {
      return {'code': response.statusCode, 'request': response.statusCode};
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('公司目录'),
        ),
        //三目运算判断当前是否请求了数据，否则直接取出
        body: companyData != null
            ? _createCompanyList()
            : new Center(
                child: new Text('正在加载，请稍后.....'),
              ));
  }
}
