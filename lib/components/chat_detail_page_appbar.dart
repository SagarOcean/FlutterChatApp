import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget{
  String text;
  String imageUrl;

  ChatDetailAppBar({@required this.text,@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: Colors.black,),
              ),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                maxRadius: 20,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(text,style: TextStyle(color: Colors.green,fontSize: 12),),
                    SizedBox(height: 6,),
                    Text("Online",style: TextStyle(color: Colors.green,fontSize: 12),),
                  ],
                )
              ),
              Icon(Icons.more_vert,color: Colors.grey.shade700,),
            ]
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
}