import 'package:chat_app/components/chat.dart';
import 'package:chat_app/models/chat_users.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUser= [
    ChatUsers(imageUrl: "https://images.wallpapersden.com/image/download/hot-blonde-girl-in-red_a2ZmZWuUmZqaraWkpJRmZW1lrWdoaWU.jpg",
        secondaryText: "Awesome Setup", text: "Love", time: "Now"),

    ChatUsers(imageUrl: "https://1.bp.blogspot.com/-AE3NfGDz5rM/Wcw7nzr_SkI/AAAAAAAAArQ/qqW9VVkm0YA9LnaR3hAy90XPUM2AltE5ACLcBGAs/s1600/FormatFactorynatasha_malkova_offical___BX3nEyUD2L1___.jpg",
        secondaryText: "That's great", text: "Mishti", time: "Yesterday"),

    ChatUsers(imageUrl: "https://wallpapercave.com/wp/wp4272495.jpg",
        secondaryText: "Hey Where are u", text: "Pooja", time: "28 Dec"),

    ChatUsers(imageUrl: "http://www.teluguclix.com/image/pooja-hegde-in-aravinda-sametha/pooja-hegde-ultra-HD-aravindha-sametha-2.jpg",
        secondaryText: "Busy! call me in 20 min", text: "Dolly", time: "28 Dec"),

    ChatUsers(imageUrl: "https://www.mordeo.org/files/uploads/2018/09/Asian-Hot-Dream-Girl-4K-Ultra-HD-Mobile-Wallpaper.jpg",
        secondaryText: "Thank u", text: "Twinkle", time: "26 Dec"),

    ChatUsers(imageUrl: "https://www.imagesjunction.com/images/img/beautiful_girls_dp_images.jpg",
        secondaryText: "will update you in evening", text: "Khushi", time: "25 Dec"),

    ChatUsers(imageUrl: "http://3.bp.blogspot.com/-n5J2v9d946I/VH8aFFBQv0I/AAAAAAAAPlM/qTKPEwve4iU/s1600/girl-3d-wallpapers.jpg",
        secondaryText: "Can you please share the file!!", text: "Deepika", time: "22 Dec"),

    ChatUsers(imageUrl: "https://hd-desktopwallpapers.com/wallpaper/M001/C009/WP0000581/Thumb/Beautiful-Livchik.jpg",
        secondaryText: "hOW R U", text: "Ruhi", time: "20 Dec"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16,right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Chats",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      Container(
                        padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add,color: Colors.pink,size: 20,),
                            SizedBox(width: 2,),
                            Text("New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                  ),

                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search....",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.cyan.shade100
                    )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUser.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return ChatUserList(
                      imageUrl: chatUser[index].imageUrl,
                      secondaryText: chatUser[index].secondaryText,
                      text: chatUser[index].text,
                      time: chatUser[index].time,
                      isMessageRead: ( index == 0 || index == 3)? true : false,
                  );
                }
            ),
          ],

        )
      ),
    );
  }
}