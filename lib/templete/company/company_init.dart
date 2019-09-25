import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'company_item.dart';

class CompanyInitPage extends StatefulWidget {
  final String id;
  CompanyInitPage(this.id)

  @override
  _CompanyInitPage createState() => _CompanyInitPage();
}

class _CompanyInitPage extends State<CompanyInitPage>{
  Future getItemParams() async{
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
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(),
      body: ,
    );
  }
}
