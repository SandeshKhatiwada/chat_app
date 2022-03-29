// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});
  // const ChatScreen({ Key? key }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _chatBubble(Message message, bool isMe, bool isSameUser){
    if (isMe){
      return Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *0.80
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Text(message.text,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                    !isSameUser ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Container(
                           child: Text(message.time,
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black45
                           ),
                           ),
                         ),
                         SizedBox(width: 5),
                        Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                              
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(message.sender.imageUrl),
                        ),
                         ),
                         
                      ],
                    ) 
                    :
                   Container(child: null,),
                  ],
                );
    }
    else {
       return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *0.80
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Text(message.text,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        ),
                      ),
                    ),
                    !isSameUser?
                    Row(
                      children: [
                        Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                              
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(message.sender.imageUrl),
                        ),
                         ),
                         SizedBox(width: 5),
                         Container(
                           child: Text(message.time,
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black45
                           ),
                           ),
                         )
                      ],
                    )
                    :
                    Container(child: null,)
                  ],
                );
    }
    
  }

   _sendMessageArea(){
     return Container(
       padding: EdgeInsets.symmetric(
         horizontal :8,
       ),
       height: 70,
       color: Colors.white,
       child: Row(children: [
         IconButton(onPressed: (){}, icon: Icon(Icons.photo),
         iconSize: 25,
         color: Theme.of(context).primaryColor,
         ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Send a message...."),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          SizedBox(width: 15),
         IconButton(onPressed: (){}, icon: Icon(Icons.send),
         iconSize: 25,
         color: Theme.of(context).primaryColor,
         ),
       ],),
     );
   }
  @override
  Widget build(BuildContext context) {
    int prevUserId=9999;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          textAlign:TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text:widget.user.name , style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
              TextSpan(text: "\n"),
              widget.user.isOnline?
              TextSpan(text: "Online", style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              )):
              TextSpan(text: "Offline", style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ))
            ]
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call_sharp)),
        ],       
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder:(BuildContext context , int index){
               
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              }
            ),
            ),
            _sendMessageArea(),
          
        ],
          )
    );
    
  }
}