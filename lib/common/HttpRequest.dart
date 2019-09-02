import 'dart:io';
import 'dart:convert';

class HttpRequest {
  static void ajaxPost(String url, Function successFun, Function errorFun,
      {Map<String, String> pamaras}) async {
    try {
      //创建一个httpClient
      HttpClient httpClient = new HttpClient();
      //打开请求连接
      // var uri = new Uri.http('127.0.0.1:8000', '/company/getList');
      // var request = await httpClient.postUrl(uri);
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      //请求头
      request.headers.set('User-Agent', 'application/json');
      //关闭连接，等待服务器连接
      HttpClientResponse response = await request.close();
      //获取响应的内容
      successFun(data) {
        data = response.transform(utf8.decoder).join();
      }

      httpClient.close();
    } catch (e) {
      errorFun(e) {}
    }
  }
}
