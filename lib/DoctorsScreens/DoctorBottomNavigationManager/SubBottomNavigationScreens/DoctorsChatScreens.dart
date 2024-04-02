import 'package:doctari/ChatScreen/ChatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorChatsScreens extends StatelessWidget {
  const DoctorChatsScreens();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.grey.shade100,
            surfaceTintColor: Colors.grey.shade100,
            title: Text("Chats",
              style: TextStyle(
                  fontSize: 22, color: Colors.black,
                  inherit: false, fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 12,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChatOneScreen();
                    },
                    )
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/68/41/87/6841874b97182f7125403fd68d26e126.jpg"
                      ),
                    ),
                  title: Text(
                    "Abdul Rehman",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        inherit: false,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    "Me: ok!",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        inherit: false,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
