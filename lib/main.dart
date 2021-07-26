import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String firstName, lastName;
  String message = 'Hello World!';
  
  // TextField controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  
  // method to display full name
  void showName() {
    setState(() {
      // check to make sure both text fields have values before displaying them
      if (firstNameController.text.isNotEmpty && 
          lastNameController.text.isNotEmpty) {
        message = 'Hello ${firstNameController.text}, ${lastNameController.text}';
        // firstNameController.clear();
        // lastNameController.clear();
      }
    });
  }
  
  // method to clear all text field
  void clearTextFields() {
    setState(() {
      firstNameController.clear();
      lastNameController.clear();
      message = 'Hello World!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello App'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )
              ),
              SizedBox(height: 10),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  hintText: 'first name',
                  contentPadding: EdgeInsets.only(left: 10)
                )
              ),
              SizedBox(height: 10),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  hintText: 'last name',
                  contentPadding: EdgeInsets.only(left: 10)
                )
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: Text('Show Name'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.green[100]),
                    ),
                    onPressed: showName,
                  ),
                  TextButton(
                    child: Text('Clear Fields'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red[100]),
                    ),
                    onPressed: clearTextFields,
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
