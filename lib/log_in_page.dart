import 'package:flutter/material.dart';
import 'package:iap/main_page.dart';

class Log_in_page extends StatefulWidget {
  @override
  _Log_in_pageState createState() => _Log_in_pageState();
}

class _Log_in_pageState extends State<Log_in_page> {
  TextEditingController user_name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool user_b, password_b;
  var user_form_key = GlobalKey<FormState>();
  var pass_form_key = GlobalKey<FormState>();

  void tap() {
    if ((user_form_key.currentState.validate()) &&
        (pass_form_key.currentState.validate())) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Main_page();
          },
        ),
      );
    } else {
      print("enter your info");
    }
  }

  Button button = new Button();

  @override
  Widget build(BuildContext context) {
    var screen_size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: null,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Icon(
                  Icons.account_circle,
                  size: 150,
                ),
              ),
              Form(
                key: user_form_key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter user name!";
                      else
                        user_b = false;
                    },
                    controller: user_name,
                    onFieldSubmitted: (user) {
                      user_b = true;
                    },
                    decoration: InputDecoration(
                      labelText: "user name",
                      border: OutlineInputBorder(
                        gapPadding: 3,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ), //user name
              Form(
                key: pass_form_key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter password!";
                      else
                        password_b = false;
                    },
                    obscureText: true,
                    controller: password,
                    onFieldSubmitted: (pass) {
                      password_b = true;
                    },
                    decoration: InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder(
                        gapPadding: 3,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ), //password
              button.button(tap),
              Container(
                height: screen_size.width / 3,
                width: screen_size.width / 3,
                alignment: Alignment.bottomCenter,
                child: Text("Contact us at"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button {
  /*Function on_tap;
  Button(this.on_tap);*/

  Widget button(Function on_tap) {
    return RaisedButton(
      padding: EdgeInsets.only(right: 40, left: 40, top: 15, bottom: 15),
      onPressed: on_tap,
      color: Colors.deepOrange,
      child: Text("Log In"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
    );
  }
}
