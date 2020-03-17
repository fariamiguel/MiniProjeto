import 'dart:async';

class Item{

  String name;
  int quantity;
  String prince;
  String urlPhoto;

  Item(this.name, this.quantity, this.prince, this.urlPhoto);

List<Item> items = [
Item("Coca-Cola", 2, "1,20€", "assets\Coca-Cola.jpg"),
Item("Melancia", 1, "3,50€", "assets\Melancia.jpg"),
];
}

class DataSource{
  final _datasource = [];
  static DataSource _instance;
  DataSource._internal();

  static DataSource getInstance(){
    if(_instance == null){
      _instance = DataSource._internal();
    }
    return _instance;
  }

  List getAll() => _datasource;
}

