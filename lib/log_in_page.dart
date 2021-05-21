import 'package:flutter/material.dart';
import 'package:iap/main_page.dart';

class Log_in_page extends StatefulWidget {
  @override
  _Log_in_pageState createState() => _Log_in_pageState();
}

class _Log_in_pageState extends State<Log_in_page> {
  TextEditingController user_name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var user_form_key = GlobalKey<FormState>();
  var pass_form_key = GlobalKey<FormState>();

  void tap() {
    if ((user_form_key.currentState.validate()) &&
        (pass_form_key.currentState.validate())) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation =CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(scale: animation,child: child,alignment: Alignment.center,);
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
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
                        return "";
                    },
                    controller: user_name,
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
                        return "";
                    },
                    obscureText: true,
                    controller: password,
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
