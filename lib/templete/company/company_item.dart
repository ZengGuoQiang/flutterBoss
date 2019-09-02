import 'package:flutter/material.dart';

class CompanyItem extends StatefulWidget {
  final String id, logo, company, info, hot, place;
  CompanyItem(this.id, this.logo, this.company, this.hot, this.info, this.place,
      this.onPressed);
  VoidCallback onPressed;

  @override
  _CompanyItem createState() => _CompanyItem();
}

class _CompanyItem extends State<CompanyItem> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Offstage(
              offstage: true,
              child: new Text(widget.id),
            ),
            new Container(
              child: Image.asset(widget.logo, height: 24.0),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.company,
                  /* 公名*/
                  style: new TextStyle(fontSize: 25.0),
                ),
                new Text(widget.info, style: new TextStyle(fontSize: 20.0)),
                /*内容*/
                new Text(widget.place,
                    style: new TextStyle(fontSize: 20.0)), /*地址*/
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                    widget.hot == true ? Icons.favorite : Icons.favorite_border,
                    color: widget.hot == true ? Colors.red : null)
              ], /*hot*/
            )
          ],
        ));
  }
}
