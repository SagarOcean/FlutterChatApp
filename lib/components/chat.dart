import 'package:chat_app/modules/chat_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserList extends StatefulWidget{
  String text;
  String secondaryText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ChatUserList({@required this.imageUrl,@required this.secondaryText,@required this.text,@required this.time,@required this.isMessageRead});

  @override
  _ChatUserState createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUserList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ChatDetailPage();
          }));
        },
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16,bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl),
                        maxRadius: 30,
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.text),
                            SizedBox(height: 6,),
                            Text(widget.secondaryText,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(widget.time, style: TextStyle(fontSize: 12, color: widget.isMessageRead? Colors.pink: Colors.grey.shade500),)
            ],
          ),
        ),
      );
  }
}