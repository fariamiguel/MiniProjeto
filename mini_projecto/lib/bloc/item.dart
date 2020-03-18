import 'dart:async';

class Item{

  String _name;
  int _quantity;
  String _price;
  String _urlPhoto;

  Item(this._name, this._quantity, this._price, this._urlPhoto);

  //getters
  String get name => this.name;
  int get quantity => this.quantity;
  String get price => this.price;
  String get urlPhoto => this.urlPhoto;


}

