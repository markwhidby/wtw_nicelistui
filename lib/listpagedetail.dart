import 'package:flutter/material.dart';
import 'topappbar.dart';

class ListPageDetail extends StatefulWidget {
  ListPageDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageDetailState createState() => _ListPageDetailState();
}

class _ListPageDetailState extends State<ListPageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
//      bottomNavigationBar: makeBottom,
    );
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text('WtW'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );

  final makeBody = Center(
    child: Column(
      children: <Widget>[
        new StartingPointForm(),
//        new SizedBox(height: 200.0),
//        new Image.network(
//          'https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_badge_2up.png',
//          fit: BoxFit.cover,
//        ),
      ],
    ),
  );
}

// Create a Form Widget
class StartingPointForm extends StatefulWidget {
  @override
  StartingPointFormState createState() {
    return StartingPointFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class StartingPointFormState extends State<StartingPointForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _latController = TextEditingController();
  final _longController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _nameController.dispose();
    super.dispose();
  }

  Widget nameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.place, color: Colors.white),
        hintText: 'Enter name',
        labelText: 'Name',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget cityField() {
    return TextFormField(
      controller: _cityController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone, color: Colors.white),
        hintText: 'Enter city',
        labelText: 'City',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget stateField() {
    return TextFormField(
      controller: _stateController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone, color: Colors.white),
        hintText: 'Enter state',
        labelText: 'State',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget zipField() {
    return TextFormField(
      controller: _zipController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone, color: Colors.white),
        hintText: 'Enter zip',
        labelText: 'Zip',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget latField() {
    return TextFormField(
      controller: _latController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.near_me, color: Colors.white),
        hintText: 'Enter latitude',
        labelText: 'Latitude',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget longField() {
    return TextFormField(
      controller: _longController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.near_me, color: Colors.white),
        hintText: 'Enter longitude',
        labelText: 'Longitude',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          nameField(),
          // cityField(),
          // stateField(),
          // zipField(),
          latField(),
          longField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(_nameController.text)));

                    // return showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       // Retrieve the text the user has typed in using our
                    //       // TextEditingController
                    //       content: Text(_nameController.text),
                    //     );
                    //   },
                    // );
                  }
                },
                child: Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
