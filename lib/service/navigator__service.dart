import '../menus/menu.dart';

class Navigator{
  static final List<Menu> _menus = [];

  static Future _runMenu() async{
    await _menus.last.build();
  }

  static Future push(Menu menu) async{
    _menus.add(menu);
    await _runMenu();
  }
}