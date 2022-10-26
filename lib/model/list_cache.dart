import 'dart:collection';

import 'package:path/path.dart';
import 'package:pdm/model/list.dart';

class ListCache {
  var _index = -1;

  final List<ListItems> _todos = [
    ListItems("Futsal", "Horario: 19hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Piscina", "Horario: 10hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Jiu Jtsu", "Horario: 20hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Jiu Jtsu", "Horario: 20hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Jiu Jtsu", "Horario: 20hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Jiu Jtsu", "Horario: 20hs", "lib/assets/jiu-jitsu.jpg"),
    ListItems("Academia", "Horario: 6 as 23hs", "lib/assets/jiu-jitsu.jpg"),
  ];

  void addItem(String name, String descr, String linkImg) {
    _todos.add(ListItems(name, descr, linkImg));
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _todos.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<ListItems> get list =>
      UnmodifiableListView<ListItems>(_todos);
}
