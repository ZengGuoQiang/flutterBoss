import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
      // var responseBody;
      // var url = 'http://10.0.2.2:8000/company/getList';
      // var httpClient = new HttpClient();
      // var request = await httpClient.postUrl(Uri.parse(url));
      // var response = await request.close();
      // if (response.statusCode == 200) {
      //   responseBody = await response.transform(utf8.decoder).join();
      //   responseBody = JsonDecoder(responseBody);
      //   print(responseBody);
      // } else {
      //   print('error');
      // }
      // await responseBody['msg'].map((Map item) {
      //   rowData.add(item);
      // }).toList();

      // HttpRequest.ajaxPost(
      //   'http://10.0.2.2:8000/company/getList',
      // (data) {
      //   print(data);
      // }, () {
      // });

      // final response = await http.get('http://127.0.0.1:8000/company/getList');
      final response = await http.get('http://localhost:8080/lhsh_portal/trq/ysht/cbcdyxjl/selectCbcdyxjlByPage');
      if (response.statusCode == 200) {
        Map<String, dynamic> result = json.decode(response.body);
        print(result);
        // for (dynamic data in result['data']['companies']) {

        // }
      }
    }

    ;

    // void _getCompanyList() async {
    //   try {
    //     http.Response res =
    //         await http.post('http://127.0.0.1:8000/company/getList');
    //     print(res);
    //   } catch (e) {}
    // }

    _getCompanyList();

    return new GestureDetector(
      child: new ListView(),
    );
  }
}
