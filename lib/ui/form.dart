import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviez/util/movie.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.text, // Use email input type for emails.
                    decoration: new InputDecoration(
                        labelText: 'Movie Title',
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Description'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Year'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Director'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Language'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Type'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Image URls'
                    )
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Ratings'
                    )
                ),new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Runtime'
                    )
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Add',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () => null,
                    color: Colors.lightBlueAccent,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
