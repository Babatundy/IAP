import 'package:flutter/material.dart';

class About_us extends MaterialPageRoute{
  About_us():super(builder: (BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("About me"),
      ),
    );
  });
}

class Contact_us extends MaterialPageRoute{
  Contact_us():super(builder: (BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("Contact Us"),
      ),
    );
  });
}