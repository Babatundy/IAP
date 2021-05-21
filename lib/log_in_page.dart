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

  void tap() {
    if((password_b==true)&&(user_b==true)) {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Main_page();
      }));
    }
    else{
      print("enter your info");
    }
  }

  Button button = new Button();

  @override
  Widget build(BuildContext context) {
    var screen_size=MediaQuery.of(context).size;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: user_name,
                  onFieldSubmitted: (user){
                    user_b=true;
                  },
                  decoration: InputDecoration(
                    labelText: "user name",
                    border: OutlineInputBorder(
                      gapPadding: 3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ), //user name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  onFieldSubmitted: (pass){
                    password_b=true;
                  },
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                      gapPadding: 3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ), //password
              button.button(tap),
              Container(
                height: screen_size.width/3,
                width: screen_size.width/3,
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
      padding: EdgeInsets.only(right: 40,left: 40,top: 15,bottom: 15),
      onPressed: on_tap,
      color: Colors.deepOrange,
      child: Text("Log In"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
    );
  }
}
