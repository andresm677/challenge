import 'dart:math';

import 'package:challenge/UserLocation/user_location.dart';
import 'package:challenge/user.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rndInt = Random().nextInt(99);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 55.0,
                    height: 55.0,
                    color: Colors.white,
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/${rndInt}.jpg"),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user.name.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.mail,
                                size: 13.0,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                                text: user.email,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.0)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.web,
                                size: 13.0,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                                text: user.website,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.0)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.phone,
                                size: 13.0,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                                text: user.phone,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.0)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserLocationScreen(
                                    address: user.address!,
                                  )));
                    },
                    child: Text("See location")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
