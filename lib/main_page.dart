import 'package:flutter/material.dart';
import 'package:iap/drawer_routs.dart';

class Main_page extends StatefulWidget {
  @override
  _Main_pageState createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  var scaff_key = GlobalKey<ScaffoldState>();

  static const drawer_head = UserAccountsDrawerHeader(
    accountName: Text("user"),
    currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.account_circle,
          size: 70,
        )),
  );

  @override
  Widget build(BuildContext context) {
    final drawer_items = ListView(
      children: [
        drawer_head,
        ListTile(
          title: Text(
            "About Us",
            style: TextStyle(fontSize: 30),
          ),
          onTap: () {
            Navigator.push(context, About_us());
          },
        ),
        ListTile(
          trailing: Icon(Icons.phone),
          title: Text(
            "Contact Us",
            style: TextStyle(fontSize: 30),
          ),
          onTap: () {
            Navigator.push(context, Contact_us());
          },
        ),
      ],
    );
    //just adding a comment
    var i = 0;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaff_key,
        appBar: AppBar(
          leading: InkWell(
            child: Image.asset("images/sonatrach_logo.png"),
            onTap: () => scaff_key.currentState.openDrawer(),
          ),
          actions: [
            IconButton(icon: Icon(Icons.logout), onPressed: (){
              Navigator.of(context).pop();
            })
          ],
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          title: Text("Main menu"),
        ),
        body: Container(
          color: Colors.black87,
        ),
        drawer: Drawer(
          elevation: 10,
          child: drawer_items,
        ),
        drawerScrimColor: Colors.white70,
      ),
    );
  }
}
