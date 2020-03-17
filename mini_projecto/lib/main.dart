import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'bloc/item.dart';

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: bluidListView(),
      floatingActionButton: SpeedDial(
        shape: CircleBorder(),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.deepOrange,
            label: 'First',
            onTap: () => print('Add Item')
          ),
          SpeedDialChild(
            child: Icon(Icons.remove),
            backgroundColor: Colors.deepPurple,
            label: 'Second',
            onTap: () => print('Remove Item')
          ),
        ],
      ),
    );
  }
   ListView bluidListView(){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Texto"),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 44,
              maxHeight: 44,
            ),
            child: Image.asset('assets/Coca-Cola.jpg', fit: BoxFit.cover),
          ),
        )
      ],
    );
   }
}
