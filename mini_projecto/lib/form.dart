
// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojecto/main.dart';


class MyForm extends StatefulWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Form',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(title: 'Form'),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }

}

class MyFormState extends State<Form>{

  File imageFile;
  final _formKey = GlobalKey<FormState>();

  _openGallery() async{
  var picture = (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
  this.setState((){
    imageFile = picture;
  });
}

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Choose your image'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  _openGallery();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and RaisedButton here.
      TextFormField(
      validator: (value){
    if(value.isEmpty){
    return 'Please enter some text';
    }
    },
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Name',
      ),
    ),
    TextFormField(
    validator: (value){
      if(value.isEmpty){
    return 'Please enter some text';
    }
    },
    decoration: const InputDecoration(
    icon: Icon(Icons.add),
    labelText: 'Quantity',
          ),
    ),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text';
              }
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.euro_symbol),
              labelText: 'Price',
            ),
          ),
          RaisedButton(
            child: Text('Selected Image'),
            onPressed: (){
              _showChoiceDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

