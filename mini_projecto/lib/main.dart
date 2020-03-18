import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'bloc/item.dart';
import 'bloc/itembloc.dart';
import 'form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperMercado',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(title: 'Lista de Compras'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final ItemBloc _itemBloc = ItemBloc();

  @override
  void dispose() {
    _itemBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder<List<Item>>(
          stream: _itemBloc.itemListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot)
          {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].name}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data[index].quantity}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "${snapshot.data[index].price} €",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Form();
        }));
    },
      )
    );
  }
   }

//floatingActionButton: SpeedDial(
//shape: CircleBorder(),
//animatedIcon: AnimatedIcons.menu_close,
//children: [
//SpeedDialChild(
//child: Icon(Icons.add),
//backgroundColor: Colors.deepOrange,
//label: 'Add Item',
//onTap: () => print('Add Item'),
//onPressed:(){
//Navigator
//}
//),
//SpeedDialChild(
//child: Icon(Icons.remove),
//backgroundColor: Colors.deepPurple,
//label: 'Remove Item',
//onTap: () => print('Remove Item')
//),
//],
//),