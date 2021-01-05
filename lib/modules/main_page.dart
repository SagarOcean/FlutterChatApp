import 'package:chat_app/modules/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current_index =0;
  final tabs = [
    ChatPage(),
    Center(child: Text("Groups"),),
    Center(child: Text("Profile"),),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
            setState(() {
              _current_index = index;
            });
        },
        currentIndex: _current_index,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message),title: Text("Chats")),
          BottomNavigationBarItem(icon: Icon(Icons.group),title: Text("Group")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text("Profile")),
        ],
      ),
      body: tabs[_current_index],
    );
  }
}