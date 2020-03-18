import 'dart:async';
import 'item.dart';

class ItemBloc{

  //sink to add in pipe
  //stream to get data from pipe

  List<Item> _itemsList = [
    Item("Coca-Cola", 2, "1,20€", "lib/assets/Coca-Cola.jpg"),
    Item("Melancia", 1, "3,50€", "lib/assets/Melancia.jpg"),
  ];

  final _itemListStreamController = StreamController<List<Item>>();

  //for inc and dec
  final _itemQuantityIncrementStreamController = StreamController<Item>();
  final _itemQuantityDecrementStreamController = StreamController<Item>();

  //getters

  Stream<List<Item>> get itemListStream =>
      _itemListStreamController.stream;

  StreamSink<List<Item>> get itemListSink =>
      _itemListStreamController.sink;

  StreamSink<Item> get itemQuantityIncrement =>
      _itemQuantityDecrementStreamController.sink;

  StreamSink<Item> get itemQuantityDecrement =>
      _itemQuantityDecrementStreamController;

  ItemBloc(){
    _itemListStreamController.add(_itemsList);
    
    _itemQuantityIncrementStreamController.stream.listen(_incrementQuantity);
    _itemQuantityDecrementStreamController.stream.listen(_decrementQuantity);

  }

  _incrementQuantity(Item item){
    int quantity = item.quantity;
    int _incrementQuantity = quantity + 1;
  }

  _decrementQuantity(Item item){
    int quantity = item.quantity;
    int _decrementQuantity = quantity - 1;
  }

  void dispose(){
    _itemQuantityIncrementStreamController.close();
    _itemQuantityDecrementStreamController.close();
    _itemListStreamController.close();
  }

}