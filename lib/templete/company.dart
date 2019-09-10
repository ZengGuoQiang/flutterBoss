import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bogusboss/common/config.dart';

// import 'package:bogusboss/common/HttpRequest.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPage createState() => _CompanyPage();
}

class _CompanyPage extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> rowData = [];

    _getCompanyList() async {
      // var responseBody, data;
      // var URL = 'http://0.0.0.0:8000/company/getList';
      // var response = await http.post('${Config.BASE_URL}/company/getList', headers : {"content-type ":"application/json"});
      HttpClient _httpclient = new HttpClient();
      _httpclient
          .post('http://127.0.0.1', 8000, 'company/getList')
          .then((HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        if (response.statusCode == 200) {
          print(response);
        } else {
          print('error');
        }
      });
      // if (response.statusCode == 200) {
      //   print(response.body);
      // } else {
      //   print('error');
      // }
      // await responseBody['msg'].map((Map item) {
      //   rowData.add(item);
      // }).toList();
    }

    _getCompanyList();

    return new GestureDetector(
      child: new ListView(),
    );
  }
}
