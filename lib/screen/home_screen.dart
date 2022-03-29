// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, unused_local_variable

import 'package:chat_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/message_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text("Inbox"),
       leading : IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
       actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.search)),
       ],
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index){
          final Message chat = chats [index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_)=>ChatScreen(
                user: chat.sender,
              ))
              ),
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration:chat.unread? BoxDecoration(
                      border: Border.all(
                        width:2,
                        color: Theme.of(context).primaryColor,
                      ),
                      shape: BoxShape.circle,
                    ) :
                     BoxDecoration(
                      shape: BoxShape.circle,
                    ),
        
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.68,
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(
                            children: [
                              Text(chat.sender.name,
                              style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                              ),
                              ),
                              chat.sender.isOnline ?
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ) : 
                              Container(child: null,)
                            ],
                          ),
                          Text(chat.time,
                          style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                                
                          ),
                          )
                        ],),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                          chat.text,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
        );
      }),   
    );
  }
}