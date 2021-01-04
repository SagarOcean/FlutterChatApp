
import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/chat_detail_page_appbar.dart';
import 'package:chat_app/models/chat_message.dart';
import 'package:chat_app/models/send_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MessageType{
  Sender,
  Receiver,
}

// ignore: must_be_immutable
class ChatDetailPage extends StatefulWidget{
  String text;
  String imageUrl;
  
  ChatDetailPage({@required this.text, @required this.imageUrl});
  
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage=[
    ChatMessage(message: "Hii dear :)", type: MessageType.Receiver),
    ChatMessage(message: "How r u", type: MessageType.Receiver),
    ChatMessage(message: "i'm good what about u!!!!", type: MessageType.Sender),
    ChatMessage(message: "i'm fine  :)", type: MessageType.Receiver),
    ChatMessage(message: "Can we meet tomorrow ", type: MessageType.Sender),
    ChatMessage(message: "yeah sure. :) I will meet you in your Home :)", type: MessageType.Receiver),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(color: Colors.amber, iconData: Icons.image, text: "Photos & Videos"),
    SendMenuItems(color: Colors.blue, iconData: Icons.insert_drive_file, text: "Documents"),
    SendMenuItems(color: Colors.orange, iconData: Icons.music_note, text: "Audio"),
    SendMenuItems(color: Colors.purple, iconData: Icons.person, text: "Contacts"),

  ];

  void showModals(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              color: Color(0xff737373),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16,),
                    Center(
                      child: Container(
                        height: 4,
                        width: 50,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    SizedBox(height: 10,),
                    ListView.builder(
                        itemCount: menuItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: menuItems[index].color.shade50,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                height: 50,
                                width: 50,
                                child: Icon(menuItems[index].iconData,size: 20,color: menuItems[index].color.shade400,),
                              ),
                              title: Text(menuItems[index].text),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailAppBar(text: widget.text,imageUrl: widget.imageUrl,),
      body: Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: chatMessage.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return ChatBubble(chatMessage: chatMessage[index]);
              }

          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16,bottom: 2),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      showModals();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(Icons.add,color: Colors.white,size: 21,),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: " Type Message !!!!",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 16,bottom: 16),
              child: FloatingActionButton(
                onPressed: (){

                },
                child: Icon(Icons.send,color: Colors.white,),
                backgroundColor: Colors.pink,
                elevation: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}