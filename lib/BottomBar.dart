import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum BottomBar{
  home,
  company,
  job,
  user,
  companyDetail
}

String barName(BottomBar bottomBar){
  switch(bottomBar){
    case BottomBar.home:
      return '首页';
    case BottomBar.company:
      return '公司';
    case BottomBar.job:
      return '工作';
    case BottomBar.user:
      return '用户';
    case BottomBar.companyDetail:
      return '公司详情';
    default:
      return '';
  }
}